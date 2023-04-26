unit Observer.IObserver;

interface

uses
  Model.Entidades.Orcamento;

type
  iObserver = interface
    ['{62276862-CD80-4897-AF21-BB26A600B0FD}']
    function Update(Value: TOrcamento): iObserver;
  end;

implementation

end.
