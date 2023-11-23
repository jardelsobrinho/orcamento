program Orcamento;

uses
  Vcl.Forms,
  FPrincipal in 'FPrincipal.pas' {frmPrincipal},
  DClientes in 'DClientes.pas' {dmClientes: TDataModule},
  DConexao in 'DConexao.pas' {dmConexao: TDataModule},
  FBasePesquisa in 'FBasePesquisa.pas' {frmBasePesquisa},
  FClientePesquisa in 'FClientePesquisa.pas' {frmClientePesquisa},
  FOrcamentoPesquisa in 'FOrcamentoPesquisa.pas' {frmOrcamentoPesquisa},
  FBaseCadastro in 'FBaseCadastro.pas' {frmBaseCadastro},
  FClienteCadastro in 'FClienteCadastro.pas' {frmClienteCadastro},
  DOrcamento in 'DOrcamento.pas' {dmOrcamento: TDataModule},
  FOrcamentoCadastro in 'FOrcamentoCadastro.pas' {frmOrcamentoCadastro},
  FOrcamentoItemCadastro in 'FOrcamentoItemCadastro.pas' {frmOrcamentoItemCadastro};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmConexao, dmConexao);
  Application.CreateForm(TdmClientes, dmClientes);
  Application.CreateForm(TdmOrcamento, dmOrcamento);
  Application.Run;
end.
