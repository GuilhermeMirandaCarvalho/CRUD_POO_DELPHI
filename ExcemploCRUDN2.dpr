program ExcemploCRUDN2;
uses
  Vcl.Forms,
  View.Principal in 'View.Principal.pas' {ViewPrincipal},
  Model.Conexao.Firedac in 'model\conexao\Model.Conexao.Firedac.pas',
  Model.Conexao.Interfaces in 'model\conexao\Model.Conexao.Interfaces.pas',
  Model.DAO.Interfaces in 'model\dao\Model.DAO.Interfaces.pas',
  Controle.Controle in 'controle\Controle.Controle.pas',
  Controle.Entidades in 'controle\Controle.Entidades.pas',
  Controle.Interfaces in 'controle\Controle.Interfaces.pas',
  View.Editar in 'View.Editar.pas' {Form2},
  Model.Entidades.CentroCusto in 'model\entidades\Model.Entidades.CentroCusto.pas',
  Model.DAO.CentroCusto in 'model\dao\Model.DAO.CentroCusto.pas',
  Model.Entidades.Orcamento in 'model\entidades\Model.Entidades.Orcamento.pas',
  Model.DAO.Orcamento in 'model\dao\Model.DAO.Orcamento.pas',
  Observer.Model.Interfaces in 'model\observer\Observer.Model.Interfaces.pas',
  Observer.Model.Observer in 'model\observer\Observer.Model.Observer.pas',
  Observer.IObserver in 'model\observer\Observer.IObserver.pas',
  Observer.ISubject in 'model\observer\Observer.ISubject.pas',
  Observer.ConcreteObserver in 'model\observer\Observer.ConcreteObserver.pas',
  Observer.ConcreteSubject in 'model\observer\Observer.ConcreteSubject.pas';

{$R *.res}
begin
  Application.Initialize;
  Application.MainFormOnTaskbar:=True;
  Application.CreateForm(TViewPrincipal, ViewPrincipal);
  Application.Run;
end.
