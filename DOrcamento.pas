unit DOrcamento;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, DConexao, Dialogs,
  Controls;

type
  TdmOrcamento = class(TDataModule)
    qryOrcamentoPesquisa: TFDQuery;
    qryOrcamentoPesquisaID: TIntegerField;
    qryOrcamentoPesquisaDATA_CADASTRO: TDateField;
    qryOrcamentoPesquisaDATA_ENTREGA: TDateField;
    qryOrcamentoPesquisaCARRO: TStringField;
    qryOrcamentoPesquisaCONCLUIDO: TStringField;
    qryOrcamentoPesquisaVALOR_TOTAL: TFloatField;
    qryOrcamentoPesquisaCLIENTE_NOME: TStringField;
    qryOrcamentoCadastro: TFDQuery;
    updOrcamentoCadastro: TFDUpdateSQL;
    qryRetornaOrcamentoId: TFDQuery;
    qryRetornaOrcamentoIdORCAMENTO_ID: TLargeintField;
    qryOrcamentoCadastroID: TIntegerField;
    qryOrcamentoCadastroCLIENTE_ID: TIntegerField;
    qryOrcamentoCadastroDATA_CADASTRO: TDateField;
    qryOrcamentoCadastroDATA_ENTREGA: TDateField;
    qryOrcamentoCadastroCARRO: TStringField;
    qryOrcamentoCadastroCONCLUIDO: TStringField;
    qryOrcamentoCadastroVALOR_TOTAL: TFloatField;
    qryOrcamentoItemCadastro: TFDQuery;
    updOrcamentoItemCadastro: TFDUpdateSQL;
    qryOrcamentoItemCadastroID: TIntegerField;
    qryOrcamentoItemCadastroORCAMENTO_ID: TIntegerField;
    qryRetornaOrcamentoItemId: TFDQuery;
    qryRetornaOrcamentoItemIdORCAMENTO_ITEM_ID: TLargeintField;
    qryOrcamentoItemCadastroDESCRICAO: TStringField;
    qryOrcamentoItemCadastroVALOR: TFloatField;
    procedure qryOrcamentoCadastroNewRecord(DataSet: TDataSet);
    procedure qryOrcamentoItemCadastroNewRecord(DataSet: TDataSet);
    procedure qryOrcamentoCadastroAfterOpen(DataSet: TDataSet);
  private
    function ValidaDados: Boolean;
    function RetornaIdOrcamento: Integer;
    function RetornaIdOrcamentoItem: Integer;
    procedure CalculaValorTotal;
    { Private declarations }
  public
    procedure Pesquisa(ClienteNome: String);
    function GravaDados: Boolean;
    procedure GravaDadosItem;
    function AlteraOrcamento: Boolean;
    procedure AlteraOrcamentoItem;
    function ExcluiOrcamento: Boolean;
    procedure ExcluiOrcamentoItem;
    procedure CancelaDados;
    procedure CancelaDadosItem;
    procedure NovoOrcamento;
    procedure NovoOrcamentoItem;
  end;

var
  dmOrcamento: TdmOrcamento;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}
{ TdmOrcamento }

function TdmOrcamento.AlteraOrcamento: Boolean;
begin
  Result := False;
  if (not qryOrcamentoPesquisa.Active) or (qryOrcamentoPesquisa.RecordCount = 0)
  then
  begin
    MessageDlg('Nenhum orçamento foi selecionado', mtWarning, [mbOk], 0);
    Exit;
  end;

  qryOrcamentoCadastro.Close;
  qryOrcamentoCadastro.ParamByName('ID').AsInteger :=
    qryOrcamentoPesquisaID.AsInteger;
  qryOrcamentoCadastro.Open;
  qryOrcamentoCadastro.Edit;

  Result := True;
end;

procedure TdmOrcamento.CancelaDados;
begin
  qryOrcamentoCadastro.Cancel;
  qryOrcamentoItemCadastro.Cancel;
end;

procedure TdmOrcamento.CancelaDadosItem;
begin
  qryOrcamentoItemCadastro.Cancel;
end;

function TdmOrcamento.ExcluiOrcamento: Boolean;
begin
  Result := False;
  if (not qryOrcamentoPesquisa.Active) or (qryOrcamentoPesquisa.RecordCount = 0)
  then
  begin
    MessageDlg('Nenhum orçamento foi selecionado', mtWarning, [mbOk], 0);
    Exit;
  end;

  if MessageDlg('Tem certeza que deseja excluir o orçamento nº ' +
    qryOrcamentoPesquisaID.AsString, mtConfirmation, [mbYes, mbNo], 0) = mrYes
  then
  begin
    qryOrcamentoCadastro.Close;
    qryOrcamentoCadastro.ParamByName('ID').AsInteger :=
      qryOrcamentoPesquisaID.AsInteger;
    qryOrcamentoCadastro.Open;

    dmConexao.fdTransacao.StartTransaction;
    try
      qryOrcamentoCadastro.Delete;
      qryOrcamentoCadastro.ApplyUpdates(0);
      dmConexao.fdTransacao.CommitRetaining;
    except
      dmConexao.fdTransacao.RollbackRetaining;
    end;
    Result := True;
  end;
end;

procedure TdmOrcamento.ExcluiOrcamentoItem;
begin
  if (not qryOrcamentoItemCadastro.Active) or (qryOrcamentoItemCadastro.RecordCount = 0)
  then
  begin
    MessageDlg('Nenhum Serviço foi selecionado', mtWarning, [mbOk], 0);
    Exit;
  end;

  if MessageDlg('Tem certeza que deseja excluir o serviço ' +
    qryOrcamentoItemCadastroDESCRICAO.AsString, mtConfirmation, [mbYes, mbNo], 0) = mrYes
  then
  begin
    qryOrcamentoItemCadastro.Delete;
    CalculaValorTotal;
  end;
end;

function TdmOrcamento.ValidaDados: Boolean;
begin
  Result := False;

  Result := True;
end;

function TdmOrcamento.GravaDados: Boolean;
begin
  Result := False;

  if not ValidaDados then
    Exit;

  dmConexao.fdTransacao.StartTransaction;
  try
    if qryOrcamentoCadastroID.AsInteger = 0 then
      qryOrcamentoCadastroID.AsInteger := RetornaIdOrcamento;

    qryOrcamentoItemCadastro.First;
    while not qryOrcamentoItemCadastro.Eof do
    begin
      if qryOrcamentoItemCadastroORCAMENTO_ID.AsInteger = 0 then
      begin
        qryOrcamentoItemCadastro.Edit;
        qryOrcamentoItemCadastroORCAMENTO_ID.AsInteger :=
          qryOrcamentoCadastroID.AsInteger;
        qryOrcamentoItemCadastro.Post;
      end;

      if qryOrcamentoItemCadastroID.AsInteger <= 0 then
      begin
        qryOrcamentoItemCadastro.Edit;
        qryOrcamentoItemCadastroID.AsInteger := RetornaIdOrcamentoItem;
        qryOrcamentoItemCadastro.Post;
      end;

      qryOrcamentoItemCadastro.Next;
    end;

    CalculaValorTotal;

    if qryOrcamentoCadastro.State in [dsInsert, dsEdit] then
      qryOrcamentoCadastro.Post;
    qryOrcamentoCadastro.ApplyUpdates(0);

    if qryOrcamentoItemCadastro.State in [dsInsert, dsEdit] then
      qryOrcamentoItemCadastro.Post;
    qryOrcamentoItemCadastro.ApplyUpdates(0);

    dmConexao.fdTransacao.CommitRetaining;
    Result := True;
  except
    dmConexao.fdTransacao.RollbackRetaining;
    raise;
  end;
end;

procedure TdmOrcamento.AlteraOrcamentoItem;
begin
  qryOrcamentoItemCadastro.Edit;
end;

procedure TdmOrcamento.CalculaValorTotal;
var
  vBookmark: TBookmark;
  vValorTotal: Double;
begin
  vBookmark := qryOrcamentoItemCadastro.GetBookmark;
  try
    qryOrcamentoItemCadastro.DisableControls;
    qryOrcamentoItemCadastro.First;
    vValorTotal := 0;
    while not qryOrcamentoItemCadastro.Eof do
    begin
      vValorTotal := vValorTotal + qryOrcamentoItemCadastroVALOR.AsFloat;
      qryOrcamentoItemCadastro.Next;
    end;

    qryOrcamentoCadastro.Edit;
    qryOrcamentoCadastroVALOR_TOTAL.AsFloat := vValorTotal;
    qryOrcamentoCadastro.Post;
  finally
    qryOrcamentoItemCadastro.EnableControls;
  end;
end;

procedure TdmOrcamento.GravaDadosItem;
begin
  qryOrcamentoItemCadastro.Post;
  CalculaValorTotal;
end;

function TdmOrcamento.RetornaIdOrcamento: Integer;
begin
  qryRetornaOrcamentoId.Close;
  qryRetornaOrcamentoId.Open;
  Result := qryRetornaOrcamentoIdORCAMENTO_ID.AsInteger;
end;

function TdmOrcamento.RetornaIdOrcamentoItem: Integer;
begin
  qryRetornaOrcamentoItemId.Close;
  qryRetornaOrcamentoItemId.Open;
  Result := qryRetornaOrcamentoItemIdORCAMENTO_ITEM_ID.AsInteger;
end;

procedure TdmOrcamento.NovoOrcamento;
begin
  qryOrcamentoCadastro.Close;
  qryOrcamentoCadastroID.AsInteger := 0;
  qryOrcamentoCadastro.Open;
  qryOrcamentoCadastro.Append;
end;

procedure TdmOrcamento.NovoOrcamentoItem;
begin
  qryOrcamentoItemCadastro.Append;
end;

procedure TdmOrcamento.Pesquisa(ClienteNome: String);
begin
  qryOrcamentoPesquisa.Close;
  qryOrcamentoPesquisa.SQL.Clear;
  qryOrcamentoPesquisa.SQL.Add('SELECT O.*, C.NOME CLIENTE_NOME');
  qryOrcamentoPesquisa.SQL.Add('FROM ORCAMENTO O');
  qryOrcamentoPesquisa.SQL.Add('INNER JOIN CLIENTE C ON C.ID = O.CLIENTE_ID');
  qryOrcamentoPesquisa.SQL.Add('WHERE 1 = 1');

  if ClienteNome <> '' then
    qryOrcamentoPesquisa.SQL.Add('AND C.NOME LIKE ''' + ClienteNome + '%''');

  qryOrcamentoPesquisa.SQL.Add('ORDER BY O.DATA_CADASTRO, C.NOME');
  qryOrcamentoPesquisa.Open;
end;

procedure TdmOrcamento.qryOrcamentoCadastroAfterOpen(DataSet: TDataSet);
begin
  qryOrcamentoItemCadastro.Close;
  qryOrcamentoItemCadastro.ParamByName('ORCAMENTO_ID').AsInteger :=
    qryOrcamentoCadastroID.AsInteger;
  qryOrcamentoItemCadastro.Open;
end;

procedure TdmOrcamento.qryOrcamentoCadastroNewRecord(DataSet: TDataSet);
begin
  qryOrcamentoCadastroID.AsInteger := 0;
  qryOrcamentoCadastroDATA_CADASTRO.AsDateTime := Date;
  qryOrcamentoCadastroCONCLUIDO.AsString := 'N';
  qryOrcamentoCadastroVALOR_TOTAL.AsFloat := 0;
end;

procedure TdmOrcamento.qryOrcamentoItemCadastroNewRecord(DataSet: TDataSet);
begin
  qryOrcamentoItemCadastroID.AsInteger := 0;
  qryOrcamentoItemCadastroORCAMENTO_ID.AsInteger :=
    qryOrcamentoCadastroID.AsInteger;
  qryOrcamentoItemCadastroVALOR.AsFloat := 0;
end;

end.
