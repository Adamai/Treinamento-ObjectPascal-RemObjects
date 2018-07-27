unit Controller;


interface

uses  Data.DBXMySQL, Data.FMTBcd, Vcl.Dialogs,Vcl.Forms,
  Datasnap.DBClient, Datasnap.Provider, Data.DB, Data.SqlExpr, Vcl.StdCtrls,
  system.SysUtils, System.Generics.Collections,NewLibrary_Intf,
  uROClient, uROClientIntf, uRORemoteService, uROBinMessage, uROWinInetHTTPChannel,
  uROChannelAwareComponent, uROBaseConnection, uROTransportChannel,
  uROBaseHTTPClient, uROComponent, uROMessage;

type
  IAtualizaTela = interface
    ['{45A3240D-60C7-4DD3-A1A2-0F8EE1BF056A}']
    //['{8FF85A15-68A4-4284-AF2E-CE7521D70C14}']
    procedure AtualizaTela;
  end;
TController = class(TObject)
  {ROMessage: TROBinMessage;
  ROChannel: TROWinInetHTTPChannel;
  RORemoteService: TRORemoteService;}
  strict private
    class var FInstance : TController;
  private
    class procedure ReleaseInstance();
  private
    FTelaPrincipal: TForm;
    FTelaSecundaria: TForm;
    procedure SetTelaPrincipal(const Value: TForm);
    procedure SetTelaSecundaria(const Value: TForm);
  public
    class function GetInstance(): TController;
    constructor create; reintroduce;
    destructor destroy; override;
    function ctrlspeciality(CSpeciality:speciality; ClientDataSet : TClientDataSet) : speciality;
    procedure clientrefresh(ClientDataSet:TClientDataSet);
    procedure pesquisar(especialidade,OS : String; ClientDataSet : TClientDataSet);
    procedure carregarCBAdmGroup(Cb : TCombobox);
    procedure AdminRefresh(ClientDataSet : TClientDataSet);
    procedure pesquisaradm(descricao, OS : String; ClientDataSet : TClientDataSet);
    function ctrladm(Cadmingroup:Admingroup; ClientDataSet : TClientDataSet) : admingroup;
    procedure AtualizarTelas();
    property TelaPrincipal : TForm read FTelaPrincipal write SetTelaPrincipal;
    property TelaSecundaria : TForm read FTelaSecundaria write SetTelaSecundaria;
end;

implementation

uses
  fClientForm;

class function TController.GetInstance: TController;
begin
  if not Assigned(FInstance) then
    FInstance := TController.Create;
  Result := FInstance;
end;

class procedure TController.ReleaseInstance;
begin
  if Assigned(FInstance) then
    FInstance.Free;
end;

procedure TController.SetTelaPrincipal(const Value: TForm);
begin
  FTelaPrincipal := Value;
end;

procedure TController.SetTelaSecundaria(const Value: TForm);
begin
  FTelaSecundaria := Value;
end;

function TController.ctrlspeciality(CSpeciality:speciality; ClientDataSet : TClientDataSet) : speciality;
var
   res : boolean;
begin
  try
   case Cspeciality.comando of
  specCMDDetalhes: result := (ClientForm.RORemoteService as INewService).carregarSpeciality(Cspeciality.id);
  specCMDExcluir: (ClientForm.RORemoteService as INewService).excluirspeciality(ClientDataSet.Fields[0].AsString);
  specCMDAlterar: (ClientForm.RORemoteService as INewService).alterarSpeciality(Cspeciality.description,CSpeciality.flag_funcao_oper,CSpeciality.codg_admingroup_fk, Cspeciality.id);
  specCMDInserir: res :=(ClientForm.RORemoteService as INewService).inserirSpeciality(Cspeciality.id, Cspeciality.description, CSpeciality.flag_funcao_oper, CSpeciality.codg_admingroup_fk);
  end;
  if (CSpeciality.comando = specCMDInserir) then
  begin
    if not res then
      begin
        showmessage('Código ja foi inserido');
        result := (ClientForm.RORemoteService as INewService).carregarSpeciality(Cspeciality.id);
      end;
  end;
  finally
    if Cspeciality.comando <> specCMDDetalhes then
    begin
      ClientRefresh(ClientDataSet);
    end;
  end;
end;

destructor TController.destroy;
begin
  {ROMessage.Free;
  ROChannel.Free;
  RORemoteService.Free;}
  inherited;
end;

procedure TController.ClientRefresh(ClientDataSet : TClientDataSet);
var
  i : integer;
  lista : ArraySpeciality;
begin
  ClientDataSet.DisableControls;
  i:=0;
  try
    ClientDataSet.EmptyDataSet;
    ClientDataSet.First;

    lista := (ClientForm.RORemoteService as INewService).ListaSpeciality;

    while (i < lista.count) do
    begin
      ClientDataSet.Append;
      ClientDataSet.FieldByName('specialityid').AsString := lista[i].id;
      ClientDataSet.FieldByName('description').AsString := lista[i].description;
      ClientDataSet.FieldByName('flag_funcao_oper').AsBoolean := lista[i].flag_funcao_oper; //PODE DAR RUIM
      ClientDataSet.FieldByName('codg_admingroup_fk').AsString := lista[i].codg_admingroup_fk;
      ClientDataSet.Next;
      i:=i+1;
    end;
    ClientDataSet.First;
  finally
    ClientDataSet.EnableControls;
    lista.Free;
  end;
end;

constructor TController.create;
begin
  inherited;
  {ROMessage := TROBinMessage.Create;
  ROChannel := TROWinInetHTTPChannel.Create(nil);
  ROChannel.UserAgent := 'RemObjects SDK';
  ROChannel.TargetUrl := 'http://127.0.0.1:8099/bin';
  ROChannel.TrustInvalidCA := False;

  RORemoteService := TRORemoteService.Create(nil);
  RORemoteService.ServiceName := 'NewService';
  RORemoteService.Channel := ROChannel;
  RORemoteService.Message := ROMessage;}
end;

procedure TController.pesquisar(especialidade, OS : String; ClientDataSet : TClientDataSet);
var
  i : integer;
  lista : ArraySpeciality;
begin
  ClientDataSet.DisableControls;
  lista := (ClientForm.RORemoteService as INewService).pesquisarSpeciality(especialidade, OS);
  i := 0;
  try
    ClientDataSet.EmptyDataSet;
    ClientDataSet.First;
    while (i < lista.count) do
    begin
      ClientDataSet.Append;
      ClientDataSet.FieldByName('specialityid').AsString := lista[i].id;
      ClientDataSet.FieldByName('description').AsString := lista[i].description;
      ClientDataSet.FieldByName('flag_funcao_oper').AsBoolean := lista[i].flag_funcao_oper; //PODE DAR MUITO RUIM
      ClientDataSet.FieldByName('codg_admingroup_fk').AsString := lista[i].codg_admingroup_fk;
      ClientDataSet.Next;
      i := i + 1;
    end;
  ClientDataSet.First;
  finally
    ClientDataSet.EnableControls;
    lista.Free;
  end;
end;

procedure TController.carregarCBAdmGroup(Cb : TCombobox);
var
  i : integer;
begin
  i:=0;
  cb.Clear;
  while (i <(ClientForm.RORemoteService as INewService).ListaAdminGroup.Count) do
  begin
    Cb.Items.Add((ClientForm.RORemoteService as INewService).ListaAdminGroup[i].id);
    i := i + 1;
  end;
end;

procedure TController.AdminRefresh(ClientDataSet : TClientDataSet);
var
  i : integer;
  lista : ArrayAdmin;
begin
  ClientDataSet.First;
  ClientDataSet.EmptyDataSet;
  ClientDataSet.DisableControls;
  i:=0;
  lista := (ClientForm.RORemoteService as INewService).ListaAdminGroup;
    try
      ClientDataSet.EmptyDataSet;
      ClientDataSet.First;
      while (i < lista.count) do
      begin
        ClientDataSet.Append;
        ClientDataSet.Fields[0].AsString := lista[i].id;
        ClientDataSet.Fields[1].AsString := lista[i].description;
        ClientDataSet.Next;
        i:=i+1;
      end;
      ClientDataSet.First;
    finally
      ClientDataSet.EnableControls;
      lista.Free;
    end;
end;


procedure TController.pesquisaradm(descricao, OS : String; ClientDataSet : TClientDataSet);
var
  i : integer;
  lista : ArrayAdmin;
begin
  ClientDataSet.DisableControls;
  i := 0;
  lista := (ClientForm.RORemoteService as INewService).pesquisaradmin(descricao, OS);
  try
    ClientDataSet.EmptyDataSet;
    ClientDataSet.First;
    while (i < lista.count) do
    begin
      ClientDataSet.Append;
      ClientDataSet.FieldByName('admingroupid').AsString := lista[i].id;
      ClientDataSet.FieldByName('description').AsString := lista[i].description;
      ClientDataSet.Next;
      i := i + 1;
    end;
    ClientDataSet.First;
  finally
    ClientDataSet.EnableControls;
    lista.Free;
  end;
end;

procedure TController.AtualizarTelas();
var
  lAtualizaTela : IAtualizaTela;
  lAtualizaTela2 : IAtualizaTela;
begin
  //(FTelaPrincipal as IAtualizaTela).atualizaTela;   //problema ?
  if supports(FTelaPrincipal, IAtualizaTela, lAtualizaTela) then
  begin
    lAtualizaTela.atualizaTela;
  end;
  if supports(FTelaSecundaria, IAtualizaTela, lAtualizaTela2) then
  begin
    lAtualizaTela2.atualizaTela;
  end;
end;


function TController.ctrladm(Cadmingroup:Admingroup; ClientDataSet : TClientDataSet) : admingroup;
var
  res : boolean;
begin
  try
    case Cadmingroup.comando of
      admCMDDetalhes: result := (ClientForm.RORemoteService as INewService).carregaradmingroup(Cadmingroup.id);
      admCMDExcluir: (ClientForm.RORemoteService as INewService).excluiradmingroup(ClientDataSet.Fields[0].AsString);
      admCMDAlterar: (ClientForm.RORemoteService as INewService).alteraradmingroup(Cadmingroup.description, Cadmingroup.id);
      admCMDInserir: res := (ClientForm.RORemoteService as INewService).inseriradmingroup(Cadmingroup.id, Cadmingroup.description);
    end;
  finally
    if Cadmingroup.comando = admCMDInserir then
      if not res then
      begin
        showmessage('Código ja foi inserido!');
        result := (ClientForm.RORemoteService as INewService).carregaradmingroup(Cadmingroup.id);
      end;

    if Cadmingroup.comando <> admCMDDetalhes then
    begin
      adminRefresh(ClientDataSet);    //comentado?
      AtualizarTelas;
    end;
  end;
end;


initialization
finalization
  TController.ReleaseInstance();

end.
