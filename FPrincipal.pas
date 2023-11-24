unit FPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, FClientePesquisa, FOrcamentoPesquisa,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.Tabs;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    menuCliente: TMenuItem;
    menuOrcamento: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure Sair1Click(Sender: TObject);
    procedure menuClienteClick(Sender: TObject);
    procedure menuOrcamentoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.menuClienteClick(Sender: TObject);
begin
  if not assigned(frmClientePesquisa) then
    frmClientePesquisa := TfrmClientePesquisa.Create(Self);
  frmClientePesquisa.Show;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  menuOrcamento.Click;
end;

procedure TfrmPrincipal.menuOrcamentoClick(Sender: TObject);
begin
  if not assigned(frmOrcamentoPesquisa) then
    frmOrcamentoPesquisa := TfrmOrcamentoPesquisa.Create(Self);
  frmOrcamentoPesquisa.Show;
end;

procedure TfrmPrincipal.Sair1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.SpeedButton1Click(Sender: TObject);
begin
  menuCliente.Click;
end;

procedure TfrmPrincipal.SpeedButton2Click(Sender: TObject);
begin
  menuOrcamento.Click;
end;

end.
