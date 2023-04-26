unit Observer.ISubject;

interface

uses
  Model.Entidades.Orcamento,
  Observer.IObserver;

type
  iSubject = interface
    ['{A812E62E-40AF-4BA3-A671-849A81FBF78E}']
    function AddObserver(Value: iObserver): iSubject;
    function RemoveObserver(Value: iObserver): iSubject;
    function Notify(Value: TOrcamento): iSubject;
  end;

implementation

end.
