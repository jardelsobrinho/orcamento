unit FOrcamentoItemCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FBaseCadastro, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, DOrcamento, Data.DB, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmOrcamentoItemCadastro = class(TfrmBaseCadastro)
    Label1: TLabel;
    dbeDescricao: TDBEdit;
    DataSource1: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    procedure FormShow(Sender: TObject);
  private
    function ValidaDados: boolean;
  public
    procedure Gravar; override;
    procedure Fechar; override;
  end;

var
  frmOrcamentoItemCadastro: TfrmOrcamentoItemCadastro;

implementation

{$R *.dfm}

{ TfrmOrcamentoItemCadastro }

procedure TfrmOrcamentoItemCadastro.Fechar;
begin
  dmOrcamento.CancelaDadosItem;
  inherited;
end;

procedure TfrmOrcamentoItemCadastro.FormShow(Sender: TObject);
begin
  inherited;
  dbeDescricao.SetFocus;
end;

procedure TfrmOrcamentoItemCadastro.Gravar;
begin
  if not ValidaDados then
    Exit;

  dmOrcamento.GravaDadosItem;
  inherited;
end;

function TfrmOrcamentoItemCadastro.ValidaDados: boolean;
begin
  Result := False;

  if dmOrcamento.qryOrcamentoItemCadastroDESCRICAO.AsString = '' then
  begin
    MessageDlg('O campo Descrição deve ser preenchido!', mtWarning, [mbOk], 0);
    Exit;
  end;

  if dmOrcamento.qryOrcamentoItemCadastroVALOR.AsFloat <= 0 then
  begin
    MessageDlg('O campo Valor deve ser maior que zero!', mtWarning, [mbOk], 0);
    Exit;
  end;

  Result := True;
end;

end.
