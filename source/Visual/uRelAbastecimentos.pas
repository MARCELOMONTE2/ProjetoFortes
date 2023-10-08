unit uRelAbastecimentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, udmPrincipal, Data.DB;

type
  TFrmRelAbastecimentos = class(TForm)
    RLRelAbast: TRLReport;
    RLBandTitulo: TRLBand;
    RLLabel1: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    dsRelAbastecimentos: TDataSource;
    RLGroup1: TRLGroup;
    RLBand2: TRLBand;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLDraw1: TRLDraw;
    RLBandDetalhe: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLBand1: TRLBand;
    RLSystemInfo2: TRLSystemInfo;
    RLBand3: TRLBand;
    RLLabel6: TRLLabel;
    RLDraw2: TRLDraw;
    RLDBResult1: TRLDBResult;
    RLDraw3: TRLDraw;
    RLImage1: TRLImage;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelAbastecimentos: TFrmRelAbastecimentos;

implementation

{$R *.dfm}

procedure TFrmRelAbastecimentos.FormCreate(Sender: TObject);
begin
     if not (dsRelAbastecimentos.DataSet.Active) then
    dsRelAbastecimentos.DataSet.Open;
end;

end.
