unit Observer.Model.Interfaces;

interface

uses
  Model.Entidades.Orcamento;

type
  TEvDisplay = procedure (Value: string) of object;

  iObserver = interface
    ['{62276862-CD80-4897-AF21-BB26A600B0FD}']
    function Update(Value: TOrcamento): iObserver;
  end;

  iSubject = interface
    ['{A812E62E-40AF-4BA3-A671-849A81FBF78E}']
    function AddObserver(Value: iObserver): iSubject;
    function RemoveObserver(Value: iObserver): iSubject;
    function Notify(Value: TOrcamento): iSubject;
  end;

implementation

end.
