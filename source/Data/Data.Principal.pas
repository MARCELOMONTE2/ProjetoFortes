unit Data.Principal;

interface

uses
  System.SysUtils, System.Classes, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.Phys.IBBase;

type
  TDtmPrincipal = class(TDataModule)
    FbConect: TFDConnection;
    qBombas: TFDQuery;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DtmPrincipal: TDtmPrincipal;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  Forms;

procedure TDtmPrincipal.DataModuleCreate(Sender: TObject);
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
