unit FOrcamentoCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FBaseCadastro, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, DConexao, DOrcamento, Data.DB, Vcl.Mask,
  Vcl.DBCtrls, DClientes, FClienteCadastro, Vcl.Grids, Vcl.DBGrids,
  FOrcamentoItemCadastro;

type
  TfrmOrcamentoCadastro = class(TfrmBaseCadastro)
    dsOrcamento: TDataSource;
    dsListaClientes: TDataSource;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    dsOrcamentoItem: TDataSource;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    deDataEntrega: TDBEdit;
    DBEdit5: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DBLookupComboBox1: TDBLookupComboBox;
    BitBtn3: TBitBtn;
    Panel4: TPanel;
    BitBtn4: TBitBtn;
    btnAlteraServico: TBitBtn;
    BitBtn6: TBitBtn;
    DBEdit7: TDBEdit;
    Label7: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure btnAlteraServicoClick(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    procedure NovoCliente;
    procedure NovoServico;
    procedure AlteraServico;
    procedure ExcluiServico;
  public
    procedure Gravar; override;
  end;

var
  frmOrcamentoCadastro: TfrmOrcamentoCadastro;

implementation

{$R *.dfm}
{ TfrmOrcamentoCadastro }

procedure TfrmOrcamentoCadastro.AlteraServico;
begin
  dmOrcamento.AlteraOrcamentoItem;
  
  if not assigned(frmOrcamentoItemCadastro) then
    frmOrcamentoItemCadastro := TfrmOrcamentoItemCadastro.Create(Self);

  try
    frmOrcamentoItemCadastro.ShowModal;
  finally
    FreeAndNil(frmOrcamentoItemCadastro);
  end;
end;

procedure TfrmOrcamentoCadastro.BitBtn3Click(Sender: TObject);
begin
  inherited;
  NovoCliente;
end;

procedure TfrmOrcamentoCadastro.BitBtn4Click(Sender: TObject);
begin
  inherited;
  NovoServico;
end;

procedure TfrmOrcamentoCadastro.btnAlteraServicoClick(Sender: TObject);
begin
  inherited;
  AlteraServico;
end;

procedure TfrmOrcamentoCadastro.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  btnAlteraServico.Click;
end;

procedure TfrmOrcamentoCadastro.BitBtn6Click(Sender: TObject);
begin
  inherited;
  ExcluiServico;
end;

procedure TfrmOrcamentoCadastro.ExcluiServico;
begin
  dmOrcamento.ExcluiOrcamentoItem;
end;

procedure TfrmOrcamentoCadastro.FormCreate(Sender: TObject);
begin
  inherited;
  dmClientes.AtualizaListaClientes;

end;

procedure TfrmOrcamentoCadastro.FormShow(Sender: TObject);
begin
  inherited;
  deDataEntrega.SetFocus;
end;

procedure TfrmOrcamentoCadastro.Gravar;
begin
  if dmOrcamento.GravaDados then
    inherited;
end;

procedure TfrmOrcamentoCadastro.NovoCliente;
begin
  if not assigned(frmClienteCadastro) then
    frmClienteCadastro := TfrmClienteCadastro.Create(Self);

  try
    dmClientes.NovoCliente;
    if frmClienteCadastro.ShowModal = mrOk then
    begin
      dmClientes.AtualizaListaClientes;
      dmOrcamento.qryOrcamentoCadastroCLIENTE_ID.AsInteger :=
        dmClientes.qryClienteCadastroID.AsInteger;
    end;
  finally
    FreeAndNil(frmClienteCadastro);
  end;

end;

procedure TfrmOrcamentoCadastro.NovoServico;
begin
  dmOrcamento.NovoOrcamentoItem;
  
  if not assigned(frmOrcamentoItemCadastro) then
    frmOrcamentoItemCadastro := TfrmOrcamentoItemCadastro.Create(Self);

  try
    frmOrcamentoItemCadastro.ShowModal;
  finally
    FreeAndNil(frmOrcamentoItemCadastro);
  end;
end;

end.
