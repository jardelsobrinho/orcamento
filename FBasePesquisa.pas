unit FBasePesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmBasePesquisa = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    btnPesquisa: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    btnAlterar: TBitBtn;
    BitBtn5: TBitBtn;
    gridPesquisa: TDBGrid;
    dsPesquisa: TDataSource;
    procedure FormActivate(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure gridPesquisaDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Pesquisa; virtual;
    procedure LimpaDados; virtual;
    procedure Novo; virtual;
    procedure Alterar; virtual;
    procedure Excluir; virtual;
  end;

var
  frmBasePesquisa: TfrmBasePesquisa;

implementation

{$R *.dfm}

uses FClientePesquisa;

procedure TfrmBasePesquisa.Alterar;
begin
  ShowMessage('Não implementado');
end;

procedure TfrmBasePesquisa.btnPesquisaClick(Sender: TObject);
begin
  Pesquisa;
end;

procedure TfrmBasePesquisa.BitBtn2Click(Sender: TObject);
begin
  LimpaDados;
end;

procedure TfrmBasePesquisa.BitBtn3Click(Sender: TObject);
begin
  Novo;
end;

procedure TfrmBasePesquisa.btnAlterarClick(Sender: TObject);
begin
  Alterar;
end;

procedure TfrmBasePesquisa.BitBtn5Click(Sender: TObject);
begin
  Excluir;
end;

procedure TfrmBasePesquisa.Excluir;
begin
  ShowMessage('Não implementado');
end;

procedure TfrmBasePesquisa.FormActivate(Sender: TObject);
begin
  WindowState := TWindowState.wsMaximized;
end;

procedure TfrmBasePesquisa.gridPesquisaDblClick(Sender: TObject);
begin
  btnAlterar.Click;
end;

procedure TfrmBasePesquisa.LimpaDados;
begin
  ShowMessage('Não implementado');
end;

procedure TfrmBasePesquisa.Novo;
begin
  ShowMessage('Não implementado');
end;

procedure TfrmBasePesquisa.Pesquisa;
begin
  ShowMessage('Não implementado');
end;

end.
