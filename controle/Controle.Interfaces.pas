unit Controle.Interfaces;

interface

uses
  Model.DAO.Interfaces, Model.Entidades.CentroCusto,
  Model.Entidades.Orcamento;

type
  iControleEntidades = interface;

  iControle = interface
    function Entidades : iControleEntidades;
  end;

  iControleEntidades = interface
    function CentroCusto : iDAOEntity<TCentroCusto>;
    function Orcamento : iDAOEntity<TOrcamento>;
  end;

implementation

end.
