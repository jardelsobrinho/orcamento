unit FOrcamentoPesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FBasePesquisa, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, DOrcamento,
  FOrcamentoCadastro;

type
  TfrmOrcamentoPesquisa = class(TfrmBasePesquisa)
    Label1: TLabel;
    edNomeCliente: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    procedure Pesquisa; override;
    procedure LimpaDados; override;
    procedure Novo; override;
    procedure Alterar; override;
    procedure Excluir; override;
  end;

var
  frmOrcamentoPesquisa: TfrmOrcamentoPesquisa;

implementation

{$R *.dfm}

procedure TfrmOrcamentoPesquisa.Alterar;
begin
  if dmOrcamento.AlteraOrcamento then
  begin
    frmOrcamentoCadastro := TfrmOrcamentoCadastro.Create(Self);
    try
      if frmOrcamentoCadastro.ShowModal = mrOk then
        btnPesquisa.Click;
    finally
      FreeAndNil(frmOrcamentoCadastro);
    end;
  end;
end;

procedure TfrmOrcamentoPesquisa.Excluir;
begin
  if  dmOrcamento.ExcluiOrcamento then
  begin
    MessageDlg('Orçamento excluído sucesso!', mtInformation, [mbOk], 0);
    btnPesquisa.Click;
  end;
end;

procedure TfrmOrcamentoPesquisa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmOrcamentoPesquisa := nil;
  Action := caFree;

end;

procedure TfrmOrcamentoPesquisa.LimpaDados;
begin
  edNomeCliente.Clear;
end;

procedure TfrmOrcamentoPesquisa.Novo;
begin
  dmOrcamento.NovoOrcamento;
  frmOrcamentoCadastro := TfrmOrcamentoCadastro.Create(Self);
  try
    if frmOrcamentoCadastro.ShowModal = mrOk then
    begin
      btnPesquisa.Click;
    end;
  finally
    FreeAndNil(frmOrcamentoCadastro);
  end;
end;

procedure TfrmOrcamentoPesquisa.Pesquisa;
begin
  dmOrcamento.Pesquisa(edNomeCliente.Text);
end;

end.
