unit FBaseCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmBaseCadastro = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Gravar; virtual;
    procedure Fechar; virtual;
  end;

var
  frmBaseCadastro: TfrmBaseCadastro;

implementation

{$R *.dfm}

{ TfrmBaseCadastro }

procedure TfrmBaseCadastro.BitBtn1Click(Sender: TObject);
begin
  Gravar;
end;

procedure TfrmBaseCadastro.BitBtn2Click(Sender: TObject);
begin
  Fechar;
end;

procedure TfrmBaseCadastro.Fechar;
begin
  ModalResult := mrCancel;
end;

procedure TfrmBaseCadastro.Gravar;
begin
  ModalResult := mrOk;
end;

end.
