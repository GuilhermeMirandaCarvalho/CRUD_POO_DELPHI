unit Observer.Model.Orcamento;

interface

uses
  Observer.Model.Interfaces;

type
  TModelOrcamento = class(TInterfacedObject,iOrcamento)
    private

    public
      constructor Create;
      destructor Destroy; override;
      //class function New: iOrcamento;
  end;

implementation

{ TModelOrcamento }

constructor TModelOrcamento.Create;
begin

end;

destructor TModelOrcamento.Destroy;
begin

  inherited;
end;


end.
