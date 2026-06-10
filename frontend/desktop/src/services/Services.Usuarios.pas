unit Services.Usuarios;

interface

uses System.SysUtils, System.Classes, Services.Base.Cadastro, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TServiceUsuarios = class(TServiceBaseCadastro)
    mtPesquisaid: TIntegerField;
    mtPesquisanome: TStringField;
    mtPesquisalogin: TStringField;
    mtPesquisastatus: TIntegerField;
    mtPesquisatelefone: TStringField;
    mtCadastroid: TFDAutoIncField;
    mtCadastronome: TStringField;
    mtCadastrologin: TStringField;
    mtCadastrosenha: TStringField;
    mtCadastrostatus: TIntegerField;
    mtCadastrotelefone: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure mtCadastroAfterInsert(DataSet: TDataSet);
    procedure mtPesquisaSTATUSGetText(Sender: TField; var Text: string; DisplayText: Boolean);
  public
    procedure Salvar; override;
  end;

implementation

uses Providers.Request, Providers.Session, Providers.Enum.Usuario.Status;

{$R *.dfm}

procedure TServiceUsuarios.DataModuleCreate(Sender: TObject);
begin
  inherited;
  Request.BaseURL('http://localhost:9000')
    .Resource('usuarios');
end;

procedure TServiceUsuarios.mtCadastroAfterInsert(DataSet: TDataSet);
begin
  inherited;
  mtCadastrostatus.AsInteger := TUsuarioStatus.Ativo.GetValue;
end;

procedure TServiceUsuarios.mtPesquisaSTATUSGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  inherited;
  Text := TUsuarioStatus(Sender.AsInteger).ToString;
end;

procedure TServiceUsuarios.Salvar;
begin
  mtCadastrosenha.Visible := not mtCadastrosenha.AsString.Trim.IsEmpty;
  inherited;
end;

end.
