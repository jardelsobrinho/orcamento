unit FPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, FClientePesquisa, FOrcamentoPesquisa;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Clientes1: TMenuItem;
    Oramentos1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    procedure Sair1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure Oramentos1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.Clientes1Click(Sender: TObject);
begin
  if not assigned(frmClientePesquisa) then
    frmClientePesquisa := TfrmClientePesquisa.Create(Self);
  frmClientePesquisa.Show;
end;

procedure TfrmPrincipal.Oramentos1Click(Sender: TObject);
begin
  if not assigned(frmOrcamentoPesquisa) then
    frmOrcamentoPesquisa := TfrmOrcamentoPesquisa.Create(Self);
  frmOrcamentoPesquisa.Show;
end;

procedure TfrmPrincipal.Sair1Click(Sender: TObject);
begin
  Close;
end;

end.
