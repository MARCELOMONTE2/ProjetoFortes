unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Data.DB, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons,uBomba,uposto, uCalculadora;

type
  TFrmPrincipal = class(TForm)
    dsBombas: TDataSource;
    GroupBox1: TGroupBox;
    lblPreco1: TLabel;
    edtLitrosB1: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    edtValorB1: TEdit;
    BitBtn1: TBitBtn;
    GroupBox2: TGroupBox;
    lblPreco2: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtLitrosB2: TEdit;
    edtValorB2: TEdit;
    BitBtn2: TBitBtn;
    GroupBox3: TGroupBox;
    lblPreco3: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edtLitrosB3: TEdit;
    edtValorB3: TEdit;
    BitBtn3: TBitBtn;
    GroupBox4: TGroupBox;
    lblPreco4: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edtLitrosB4: TEdit;
    edtValorB4: TEdit;
    BitBtn4: TBitBtn;
    dsAbastecimentos: TDataSource;
    DBGrid1: TDBGrid;
    BitBtn5: TBitBtn;

    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure edtLitrosB1KeyPress(Sender: TObject; var Key: Char);
    procedure edtLitrosB1Exit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
     
  private
    { Private declarations }
    function NumberFloatOnly(Key: Char; texto: String): char;
    procedure IncluiAbastecimento(Bomba:Tbomba; Valor, Litros: double);
    procedure CarregaDadosBomba;
     
  public
    { Public declarations }
     PostoABC : TPosto;
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

uses uRelAbastecimentos;


procedure TFrmPrincipal.BitBtn1Click(Sender: TObject);
begin

  if (edtValorB1.Text = '0') and (edtLitrosB1.Text = '0') then
  begin
    ShowMessage('Informe o valor ou litragem do abastecimento.');
    edtValorB1.SetFocus;
    exit;
  end;

  IncluiAbastecimento(PostoABC.Bomba1,strToFloat(edtValorB1.Text),
    StrToFloat(edtLitrosB1.Text));
  edtValorB1.text := '0';
  edtLitrosB1.Text := '0';

end;

procedure TFrmPrincipal.BitBtn2Click(Sender: TObject);
begin
  if (edtValorB2.Text = '0') and (edtLitrosB2.Text = '0') then
  begin
    ShowMessage('Informe o valor ou litragem do abastecimento.');
    edtValorB2.SetFocus;
    exit;
  end;

  IncluiAbastecimento(PostoABC.Bomba2,strToFloat(edtValorB2.Text),
    StrToFloat(edtLitrosB2.Text));
  edtValorB2.text := '0';
  edtLitrosB2.Text := '0';
end;

procedure TFrmPrincipal.BitBtn3Click(Sender: TObject);
begin
  if (edtValorB3.Text = '0') and (edtLitrosB3.Text = '0') then
  begin
    ShowMessage('Informe o valor ou litragem do abastecimento.');
    edtValorB3.SetFocus;
    exit;
  end;

  IncluiAbastecimento(PostoABC.Bomba3,strToFloat(edtValorB3.Text),
    StrToFloat(edtLitrosB2.Text));
  edtValorB3.text := '0';
  edtLitrosB3.Text := '0';
end;

procedure TFrmPrincipal.BitBtn4Click(Sender: TObject);
begin
  if (edtValorB4.Text = '0') and (edtLitrosB4.Text = '0') then
  begin
    ShowMessage('Informe o valor ou litragem do abastecimento.');
    edtValorB4.SetFocus;
    exit;
  end;

  IncluiAbastecimento(PostoABC.Bomba4,strToFloat(edtValorB4.Text),
    StrToFloat(edtLitrosB4.Text));
  edtValorB4.text := '0';
  edtLitrosB4.Text := '0';
end;

procedure TFrmPrincipal.BitBtn5Click(Sender: TObject);
begin
  FrmRelAbastecimentos.RLRelAbast.Preview();
end;

procedure TFrmPrincipal.CarregaDadosBomba;
begin
  dsBombas.DataSet.First;
  while not dsBombas.DataSet.Eof do
  begin
    case dsBombas.DataSet.FieldByName('ID').AsInteger of
      1:begin
        PostoABC.Bomba1.ID := dsBombas.DataSet.FieldByName('ID').AsInteger;
        PostoABC.Bomba1.Descricao := dsBombas.DataSet.FieldByName('DESCRICAO').AsString;
        PostoABC.Bomba1.Tanque := dsBombas.DataSet.FieldByName('TANQUE').AsInteger;
        PostoABC.Bomba1.Preco:= dsBombas.DataSet.FieldByName('PRECO').AsFloat;
        PostoABC.Bomba1.Taxa_Imposto := dsBombas.DataSet.FieldByName('TAXA_IMPOSTO').AsFloat;

      end;
      2: Begin
        PostoABC.Bomba2.ID := dsBombas.DataSet.FieldByName('ID').AsInteger;
        PostoABC.Bomba2.Descricao := dsBombas.DataSet.FieldByName('DESCRICAO').AsString;
        PostoABC.Bomba2.Tanque := dsBombas.DataSet.FieldByName('TANQUE').AsInteger;
        PostoABC.Bomba2.Preco:= dsBombas.DataSet.FieldByName('PRECO').AsFloat;
        PostoABC.Bomba2.Taxa_Imposto := dsBombas.DataSet.FieldByName('TAXA_IMPOSTO').AsFloat;
      End;
      3: Begin
        PostoABC.Bomba3.ID := dsBombas.DataSet.FieldByName('ID').AsInteger;
        PostoABC.Bomba3.Descricao := dsBombas.DataSet.FieldByName('DESCRICAO').AsString;
        PostoABC.Bomba3.Tanque := dsBombas.DataSet.FieldByName('TANQUE').AsInteger;
        PostoABC.Bomba3.Preco:= dsBombas.DataSet.FieldByName('PRECO').AsFloat;
        PostoABC.Bomba3.Taxa_Imposto := dsBombas.DataSet.FieldByName('TAXA_IMPOSTO').AsFloat;
      End;
      4: Begin
        PostoABC.Bomba4.ID := dsBombas.DataSet.FieldByName('ID').AsInteger;
        PostoABC.Bomba4.Descricao := dsBombas.DataSet.FieldByName('DESCRICAO').AsString;
        PostoABC.Bomba4.Tanque := dsBombas.DataSet.FieldByName('TANQUE').AsInteger;
        PostoABC.Bomba4.Preco:= dsBombas.DataSet.FieldByName('PRECO').AsFloat;
        PostoABC.Bomba4.Taxa_Imposto := dsBombas.DataSet.FieldByName('TAXA_IMPOSTO').AsFloat;
      End;
    end;
     dsBombas.DataSet.Next;
  end;
end;

function TFrmPrincipal.NumberFloatOnly(Key: Char; texto: string): Char;
begin
  Result := key;
   if (not (Key in ['0'..'9', ',', #8, #9])) OR ( (Key = ',') and (pos(',',Texto)>0) ) then Result := #0;
end;

procedure TFrmPrincipal.edtLitrosB1Exit(Sender: TObject);
begin
  if TEdit(Sender).Text = '' then
    TEdit(Sender).Text := '0';

end;

procedure TFrmPrincipal.edtLitrosB1KeyPress(Sender: TObject; var Key: Char);
begin
  Key := NumberFloatOnly(key,TEdit(Sender).Text);
end;


procedure TFrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 PostoABC.Destroy;
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  PostoABC := TPosto.create;
  if not (dsBombas.DataSet.Active) then
    dsBombas.DataSet.Open;
  if not (dsAbastecimentos.DataSet.Active) then
    dsAbastecimentos.DataSet.Open;
  CarregaDadosBomba;
  lblPreco1.Caption := 'Pre�o: ' + FloatToStr(PostoABC.Bomba1.Preco);
  lblPreco2.Caption := 'Pre�o: ' + FloatToStr(PostoABC.Bomba2.Preco);
  lblPreco3.Caption := 'Pre�o: ' + FloatToStr(PostoABC.Bomba3.Preco);
  lblPreco4.Caption := 'Pre�o: ' + FloatToStr(PostoABC.Bomba4.Preco);
  GroupBox1.Caption := '1 - ' +  PostoABC.Bomba1.Descricao;
  GroupBox2.Caption := '2 - ' +  PostoABC.Bomba2.Descricao;
  GroupBox3.Caption := '3 - ' +  PostoABC.Bomba3.Descricao;
  GroupBox4.Caption := '4 - ' +  PostoABC.Bomba4.Descricao;
end;

procedure TFrmPrincipal.IncluiAbastecimento(Bomba: TBomba; Valor,
  Litros: double);
begin

  if Valor > 0  then
    Litros := TCalculadora.calculaLitros(Valor,Bomba.Preco)
  else
    Valor := TCalculadora.CalculaValor(Litros, Bomba.Preco);
  try
   dsAbastecimentos.DataSet.Append;
   dsAbastecimentos.DataSet.FieldByName('BOMBA').Value := bomba.ID;
   dsAbastecimentos.DataSet.FieldByName('LITROS').Value := FormatFloat('0.##', Litros);
   dsAbastecimentos.DataSet.FieldByName('VALOR_ABASTECIDO').Value := Valor;
   dsAbastecimentos.DataSet.FieldByName('VALOR_IMPOSTO').Value := TCalculadora.CalculaImposto(Valor,Bomba.Taxa_Imposto);
   dsAbastecimentos.DataSet.FieldByName('DATA').Value := NOW;
   dsAbastecimentos.DataSet.Post;
   dsAbastecimentos.DataSet.Refresh;
  Except
  on E: Exception do
    ShowMessage('Erro ao incluir o abastecimento: ' + E.Message );
  end;
end;

end.
