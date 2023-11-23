unit DClientes;

interface

uses
  System.SysUtils, System.Classes, DConexao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Dialogs, Controls;

type
  TdmClientes = class(TDataModule)
    qryClientesPesquisa: TFDQuery;
    qryClientesPesquisaID: TIntegerField;
    qryClientesPesquisaNOME: TStringField;
    qryClientesPesquisaTELEFONE: TStringField;
    qryClienteCadastro: TFDQuery;
    updClienteCadastro: TFDUpdateSQL;
    qryClienteCadastroID: TIntegerField;
    qryClienteCadastroNOME: TStringField;
    qryClienteCadastroTELEFONE: TStringField;
    qryRetornaClienteId: TFDQuery;
    qryRetornaClienteIdCLIENTE_ID: TLargeintField;
    qryListaClientes: TFDQuery;
    qryListaClientesID: TIntegerField;
    qryListaClientesNOME: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    function ValidaDados: Boolean;
    function RetornaIdCliente: Integer;
  public
    procedure Pesquisa(Nome: String);
    function GravaDados: Boolean;
    function AlteraCliente: Boolean;
    function ExcluiCliente: Boolean;
    procedure CancelaDados;
    procedure NovoCliente;
    procedure AtualizaListaClientes;
  end;

var
  dmClientes: TdmClientes;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}
{ TdmClientes }

function TdmClientes.AlteraCliente: Boolean;
begin
  Result := False;
  if (not qryClientesPesquisa.Active) or (qryClientesPesquisa.RecordCount = 0)
  then
  begin
    MessageDlg('Nenhum cliente foi selecionado', mtWarning, [mbOk], 0);
    Exit;
  end;

  qryClienteCadastro.Close;
  qryClienteCadastro.ParamByName('ID').AsInteger :=
    qryClientesPesquisaID.AsInteger;
  qryClienteCadastro.Open;
  qryClienteCadastro.Edit;

  Result := True;
end;

procedure TdmClientes.AtualizaListaClientes;
begin
  qryListaClientes.Close;
  qryListaClientes.Open;
end;

procedure TdmClientes.CancelaDados;
begin
  qryClienteCadastro.Cancel;
end;

procedure TdmClientes.DataModuleCreate(Sender: TObject);
begin
  qryClienteCadastro.Open;
end;

function TdmClientes.ExcluiCliente: Boolean;
begin
  Result := False;
  if (not qryClientesPesquisa.Active) or (qryClientesPesquisa.RecordCount = 0)
  then
  begin
    MessageDlg('Nenhum cliente foi selecionado', mtWarning, [mbOk], 0);
    Exit;
  end;

  if MessageDlg('Tem certeza que deseja excluir o cliente ' +
    qryClientesPesquisaNOME.AsString, mtConfirmation, [mbYes, mbNo], 0) = mrYes
  then
  begin
    qryClienteCadastro.Close;
    qryClienteCadastro.ParamByName('ID').AsInteger :=
      qryClientesPesquisaID.AsInteger;
    qryClienteCadastro.Open;

    dmConexao.fdTransacao.StartTransaction;
    try
      qryClienteCadastro.Delete;
      qryClienteCadastro.ApplyUpdates(0);
      dmConexao.fdTransacao.CommitRetaining;
    except
      dmConexao.fdTransacao.RollbackRetaining;
    end;
    Result := True;
  end;
end;

function TdmClientes.GravaDados: Boolean;
begin
  Result := False;

  if not ValidaDados then
    Exit;

  dmConexao.fdTransacao.StartTransaction;
  try
    if qryClienteCadastroID.AsInteger = 0 then
      qryClienteCadastroID.AsInteger := RetornaIdCliente;

    qryClienteCadastro.Post;
    qryClienteCadastro.ApplyUpdates(0);
    dmConexao.fdTransacao.CommitRetaining;
    Result := True;
  except
    dmConexao.fdTransacao.RollbackRetaining;
    raise;
  end;
end;

procedure TdmClientes.NovoCliente;
begin
  qryClienteCadastro.Close;
  qryClienteCadastro.ParamByName('ID').AsInteger := 0;
  qryClienteCadastro.Open;
  qryClienteCadastro.Append;
end;

procedure TdmClientes.Pesquisa(Nome: String);
begin
  qryClientesPesquisa.Close;
  qryClientesPesquisa.SQL.Clear;
  qryClientesPesquisa.SQL.Add('SELECT * FROM CLIENTE C');

  if Nome <> '' then
    qryClientesPesquisa.SQL.Add('WHERE C.NOME LIKE ''' + Nome + '%''');

  qryClientesPesquisa.SQL.Add('ORDER BY C.NOME');

  qryClientesPesquisa.Open;
end;

function TdmClientes.RetornaIdCliente: Integer;
begin
  qryRetornaClienteId.Close;
  qryRetornaClienteId.Open;
  Result := qryRetornaClienteIdCLIENTE_ID.AsInteger;
end;

function TdmClientes.ValidaDados: Boolean;
begin
  Result := False;
  if qryClienteCadastroNOME.AsString = '' then
  begin
    MessageDlg('O campo Nome deve ser preenchido!', mtWarning, [mbOk], 0);
    Exit;
  end;

  if qryClienteCadastroTELEFONE.AsString = '' then
  begin
    MessageDlg('O campo Telefone deve ser preenchido!', mtWarning, [mbOk], 0);
    Exit;
  end;

  Result := True;
end;

end.
