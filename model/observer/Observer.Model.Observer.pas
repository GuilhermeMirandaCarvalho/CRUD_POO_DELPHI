unit Observer.Model.Observer;

interface

uses Observer.Model.Interfaces, System.Generics.Collections,
  Model.Entidades.Orcamento;

Type
  TModelObserver = class(TInterfacedObject, iSubject)
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

{ TModelObserver }

function TModelObserver.AddObserver(Value: iObserver): iSubject;
begin
  Result := Self;
  FLista.Add(Value);
end;

constructor TModelObserver.Create;
begin
  FLista := TList<iObserver>.Create;
end;

destructor TModelObserver.Destroy;
begin
  FreeAndNil(FLista);
  inherited;
end;

class function TModelObserver.New: iSubject;
begin
  Result := Self.Create;
end;

function TModelObserver.Notify(Value: TOrcamento): iSubject;
var
  I: Integer;
begin
  Result := Self;
  for I := 0 to Pred(FLista.Count) do
    FLista.Items[I].Update(Value);
end;

function TModelObserver.RemoveObserver(Value: iObserver): iSubject;
begin
  Result := Self;
  FLista.Remove(Value);
end;

end.

