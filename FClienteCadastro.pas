unit FClienteCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FBaseCadastro, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Data.DB, Vcl.Mask, Vcl.DBCtrls, DClientes;

type
  TfrmClienteCadastro = class(TfrmBaseCadastro)
    Label1: TLabel;
    dbeNome: TDBEdit;
    dsCadastro: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Gravar; override;
  end;

var
  frmClienteCadastro: TfrmClienteCadastro;

implementation

{$R *.dfm}

{ TfrmClienteCadastro }

procedure TfrmClienteCadastro.FormShow(Sender: TObject);
begin
  inherited;
  dbeNome.SetFocus;
end;

procedure TfrmClienteCadastro.Gravar;
begin
  if dmClientes.GravaDados then
    inherited;
end;

end.
