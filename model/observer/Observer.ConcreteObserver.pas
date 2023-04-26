unit Observer.ConcreteObserver;

interface

uses
  Observer.Model.Interfaces,
  System.Generics.Collections,
  Model.Entidades.Orcamento;

Type
  TConcreteObserver = class(TInterfacedObject, iObserver)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iSubject;
    function Update(Value: TOrcamento): iObserver;
  end;

implementation



{ TConcreteObserver }

constructor TConcreteObserver.Create;
begin

end;

destructor TConcreteObserver.Destroy;
begin

  inherited;
end;

class function TConcreteObserver.New: iSubject;
begin

end;

function TConcreteObserver.Update(Value: TOrcamento): iObserver;
begin

end;

end.
