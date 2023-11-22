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
    procedure DataModuleCreate(Sender: TObject);
    procedure qryOrcamentoCadastroNewRecord(DataSet: TDataSet);
  private
    function ValidaDados: Boolean;
    function RetornaIdOrcamento: Integer;
    { Private declarations }
  public
    procedure Pesquisa(ClienteNome: String);
    function GravaDados: Boolean;
    function AlteraOrcamento: Boolean;
    function ExcluiOrcamento: Boolean;
    procedure CancelaDados;
    procedure NovoOrcamento;
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
  if (not qryOrcamentoCadastro.Active) or (qryOrcamentoCadastro.RecordCount = 0)
  then
  begin
    MessageDlg('Nenhum orçamento foi selecionado', mtWarning, [mbOk], 0);
    Exit;
  end;

  qryOrcamentoCadastro.Close;
  qryOrcamentoCadastro.ParamByName('ID').AsInteger :=
    qryOrcamentoPesquisaID.AsInteger;
  qryOrcamentoCadastro.Open;

  Result := True;
end;

procedure TdmOrcamento.CancelaDados;
begin
  qryOrcamentoCadastro.Cancel;
end;

procedure TdmOrcamento.DataModuleCreate(Sender: TObject);
begin
  qryOrcamentoCadastro.Open;
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

    qryOrcamentoCadastro.Post;
    qryOrcamentoCadastro.ApplyUpdates(0);
    dmConexao.fdTransacao.CommitRetaining;
    Result := True;
  except
    dmConexao.fdTransacao.RollbackRetaining;
    raise;
  end;
end;

function TdmOrcamento.RetornaIdOrcamento: Integer;
begin
  qryRetornaOrcamentoId.Close;
  qryRetornaOrcamentoId.Open;
  Result := qryRetornaOrcamentoIdORCAMENTO_ID.AsInteger;
end;

procedure TdmOrcamento.NovoOrcamento;
begin
  qryOrcamentoCadastro.Append;
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

procedure TdmOrcamento.qryOrcamentoCadastroNewRecord(DataSet: TDataSet);
begin
  qryOrcamentoCadastroID.AsInteger := 0;
  qryOrcamentoCadastroDATA_CADASTRO.AsDateTime := Date;
  qryOrcamentoCadastroCONCLUIDO.AsString := 'S';
  qryOrcamentoCadastroVALOR_TOTAL.AsFloat := 0;
end;

end.
