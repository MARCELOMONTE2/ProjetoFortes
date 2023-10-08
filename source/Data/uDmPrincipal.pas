unit uDmPrincipal;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Phys.IBBase, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDmPrincipal = class(TDataModule)
    FbConect: TFDConnection;
    qBombas: TFDQuery;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    qAbastecimentos: TFDQuery;
    qRelAbastecimnetos: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmPrincipal: TDmPrincipal;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  Forms;

procedure TDmPrincipal.DataModuleCreate(Sender: TObject);
var

  vName : String;
begin
  FbConect.Connected := False;

  vName := ExtractFilePath(Application.ExeName) + '..\..\db\POSTO.FDB';
  FbConect.Params.Database := vName;
  FbConect.Params.UserName := 'SYSDBA';
  FbConect.Params.Password := 'masterkey';

  FbConect.Open;

end;

end.
