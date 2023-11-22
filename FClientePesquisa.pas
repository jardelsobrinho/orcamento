unit FClientePesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FBasePesquisa, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, DClientes, Vcl.StdCtrls, Vcl.Buttons,
  FClienteCadastro;

type
  TfrmClientePesquisa = class(TfrmBasePesquisa)
    Label1: TLabel;
    edPesquisa: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    procedure LimpaDados; override;
    procedure Pesquisa; override;
    procedure Novo; override;
    procedure Alterar; override;
    procedure Excluir; override;
  end;

var
  frmClientePesquisa: TfrmClientePesquisa;

implementation

{$R *.dfm}

procedure TfrmClientePesquisa.Alterar;
begin
  if dmClientes.AlteraCliente then
  begin
    frmClienteCadastro := TfrmClienteCadastro.Create(Self);
    try
      if frmClienteCadastro.ShowModal = mrOk then
        btnPesquisa.Click;
    finally
      FreeAndNil(frmClienteCadastro);
    end;
  end;
end;

procedure TfrmClientePesquisa.Excluir;
begin
  if  dmClientes.ExcluiCliente then
  begin
    MessageDlg('Cliente excluído sucesso!', mtInformation, [mbOk], 0);
    btnPesquisa.Click;
  end;
end;

procedure TfrmClientePesquisa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmClientePesquisa := nil;
  Action := caFree;
end;

procedure TfrmClientePesquisa.FormShow(Sender: TObject);
begin
  inherited;
  dmClientes.Pesquisa('');
end;

procedure TfrmClientePesquisa.LimpaDados;
begin
  edPesquisa.Clear;
  Pesquisa;
end;

procedure TfrmClientePesquisa.Novo;
begin
  dmClientes.NovoCliente;
  frmClienteCadastro := TfrmClienteCadastro.Create(Self);
  try
    if frmClienteCadastro.ShowModal = mrOk then
    begin
      btnPesquisa.Click;
    end;
  finally
    FreeAndNil(frmClienteCadastro);
  end;
end;

procedure TfrmClientePesquisa.Pesquisa;
begin
  dmClientes.Pesquisa(edPesquisa.Text);
end;

end.
