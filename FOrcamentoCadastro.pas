unit FOrcamentoCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FBaseCadastro, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, DConexao, DOrcamento, Data.DB, Vcl.Mask,
  Vcl.DBCtrls;

type
  TfrmOrcamentoCadastro = class(TfrmBaseCadastro)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
  private
    { Private declarations }
  public
    procedure Gravar; override;
  end;

var
  frmOrcamentoCadastro: TfrmOrcamentoCadastro;

implementation

{$R *.dfm}

{ TfrmOrcamentoCadastro }

procedure TfrmOrcamentoCadastro.Gravar;
begin
  if dmOrcamento.GravaDados then
    inherited;
end;

end.
