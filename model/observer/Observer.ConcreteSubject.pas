unit Observer.ConcreteSubject;

interface

uses
  Observer.ISubject,
  Observer.IObserver,
  System.Generics.Collections,
  Model.Entidades.Orcamento;

Type
  TConcreteSubject = class(TInterfacedObject, iSubject)
  private
    FLista : TList<iObserver>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iSubject;
    function AddObserver(Value: iObserver): iSubject;
    function RemoveObserver(Value: iObserver): iSubject;
    function Notify(Value: TOrcamento): iSubject;
  end;

implementation

uses
  System.SysUtils;
{ TConcreteSubject }

function TConcreteSubject.AddObserver(Value: iObserver): iSubject;
begin
  Result := Self;
  FLista.Add(Value);
end;

constructor TConcreteSubject.Create;
begin
  FLista := TList<iObserver>.Create;
end;

destructor TConcreteSubject.Destroy;
begin
  FreeAndNil(FLista);
  inherited;
end;

class function TConcreteSubject.New: iSubject;
begin
 Result := Self.Create;
end;

function TConcreteSubject.Notify(Value: TOrcamento): iSubject;
var
  I: Integer;
begin
  Result := Self;
  for I := 0 to Pred(FLista.Count) do
    FLista.Items[I].Update(Value);
end;

function TConcreteSubject.RemoveObserver(Value: iObserver): iSubject;
begin
  Result := Self;
  FLista.Remove(Value);
end;

end.
