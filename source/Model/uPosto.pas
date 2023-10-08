unit uPosto;

interface
uses
  uBomba;
  Type

  TPosto = class
  private
    FBomba1: TBomba;
    FBomba2: TBomba;
    FBomba3: TBomba;
    FBomba4: TBomba;
    procedure SetBomba1(const Value: TBomba);
    procedure SetBomba2(const Value: TBomba);
    procedure SetBomba3(const Value: TBomba);
    procedure SetBomba4(const Value: TBomba);

  public
    Constructor create;
    destructor Destroy; override;
    property Bomba1: TBomba read FBomba1 write SetBomba1;
    property Bomba2: TBomba read FBomba2 write SetBomba2;
    property Bomba3: TBomba read FBomba3 write SetBomba3;
    property Bomba4: TBomba read FBomba4 write SetBomba4;
end;

implementation

{ TPosto }

constructor TPosto.create;
begin
  FBomba1 := TBomba.Create;
  FBomba2 := TBomba.Create;
  FBomba3 := TBomba.Create;
  FBomba4 := TBomba.Create;
end;

destructor TPosto.Destroy;
begin
  FBomba1.DisposeOf;
  FBomba2.DisposeOf;
  FBomba3.DisposeOf;
  FBomba4.DisposeOf;
  inherited;
end;

procedure TPosto.SetBomba1(const Value: TBomba);
begin
  FBomba1 := Value;
end;

procedure TPosto.SetBomba2(const Value: TBomba);
begin
  FBomba2 := Value;
end;

procedure TPosto.SetBomba3(const Value: TBomba);
begin
  FBomba3 := Value;
end;

procedure TPosto.SetBomba4(const Value: TBomba);
begin
  FBomba4 := Value;
end;

end.
