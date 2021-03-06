unit fClientForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  uROClient, uROClientIntf, uRORemoteService, uROBinMessage, uROWinInetHTTPChannel,
  Data.DB, Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  uROChannelAwareComponent, uROBaseConnection, uROTransportChannel,
  uROBaseHTTPClient, uROComponent, uROMessage, specialitycr,NewLibrary_Intf, AdminGroupGer, controller;

type
  TClientForm = class(TForm, IAtualizaTela)
    ROMessage: TROBinMessage;
    ROChannel: TROWinInetHTTPChannel;
    RORemoteService: TRORemoteService;
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    CheckBox1: TCheckBox;
    Button1: TButton;
    ComboBox1: TComboBox;
    Alterar: TButton;
    Incluir: TButton;
    Excluir: TButton;
    SO: TButton;
    Cancelar: TButton;
    ClientDataSet1: TClientDataSet;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    procedure Button1Click(Sender: TObject);
    procedure AlterarClick(Sender: TObject);
    procedure ExcluirClick(Sender: TObject);
    procedure SOClick(Sender: TObject);
    procedure CancelarClick(Sender: TObject);
    procedure AtualizaTela;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure IncluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ClientForm: TClientForm;

implementation

procedure TClientForm.AlterarClick(Sender: TObject);
var
  Form2 : TFormSp;
begin
  Form2 := TFormSp.Create(Form2);
  try
    Form2.Alterar := true;
    Form2.ClientDataSet := ClientDataSet1;
    Form2.Edit1.Text := ClientDataSet1.Fields[0].AsString;
    Form2.Edit1.ReadOnly := true;
    Form2.Edit2.Text := ClientDataSet1.Fields[1].AsString;
    if ClientDataSet1.Fields[2].AsString = 'B' then
    begin
      Form2.CheckBox1.Checked := true;
    end;
    //Form2.ComboBox1.Text := ClientDataSet1.Fields[3].AsString;
    Form2.ComboBox1.ItemIndex := Form2.ComboBox1.Items.IndexOf(ClientDataSet1.Fields[3].AsString);
    Form2.ShowModal;
  finally
    Form2.Free;
  end;
end;

procedure TClientForm.AtualizaTela;
begin

  ComboBox1.Clear;
  TController.getinstance.ClientRefresh(ClientDataSet1);
  TController.getinstance.carregarCBAdmGroup(combobox1);

end;

procedure TClientForm.Button1Click(Sender: TObject);
begin

  if checkbox1.Checked = true then
  begin
    tcontroller.getinstance.pesquisar(edit1.text,combobox1.text, ClientDataSet1);
  end
  else
  begin
    tcontroller.getinstance.pesquisar(edit1.text,'', ClientDataSet1);
  end;

end;




procedure TClientForm.ExcluirClick(Sender: TObject);
var
  CSpeciality : speciality;
begin
  try
    CSpeciality := speciality.Create;
    CSpeciality.id := DBGrid1.Fields[0].AsString;
    CSpeciality.comando := specCMDDetalhes;
    CSpeciality := TController.GetInstance.CtrlSpeciality(CSpeciality, ClientDataSet1);   //l
    CSpeciality.comando := specCMDExcluir;
    TController.GetInstance.CtrlSpeciality(CSpeciality, ClientDataSet1);
  finally
    CSpeciality.Free;
  end;

end;



procedure TClientForm.FormCreate(Sender: TObject);
begin
  ClientForm := self;
  TController.GetInstance.TelaPrincipal := self;
  AtualizaTela;
  ComboBox1.Enabled := false;
  ComboBox1.Style := csDropDownList;
end;


procedure TClientForm.IncluirClick(Sender: TObject);
var
  Form2 : TFormSP;
begin
  Form2.Alterar :=false;
  Form2 := TFormSP.Create(Form2);
  Form2.ClientDataSet := ClientDataSet1;
  try
    Form2.ShowModal;
  finally
    Form2.Free;
  end;
end;

procedure TClientForm.SOClick(Sender: TObject);
var
  Form3 : TFormAgGer;
begin
  Form3 := TFormAgGer.Create(Form3);
  //Form3.ClientDataSet1 := clientdataset1;
  try
    Form3.ShowModal;
  finally
    Form3.Free;
  end;

end;

procedure TClientForm.CancelarClick(Sender: TObject);
begin
  close;
end;



procedure TClientForm.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
  begin
    ComboBox1.Enabled := true;
  end;
  if not CheckBox1.Checked then
  begin
    ComboBox1.Enabled := false;
  end;
end;


{
  The unit NewLibrary_Intf.pas will be generated by the RemObjects preprocessor the first time you
  compile your server application. Make sure to do that before trying to compile the client.

  To invoke your server simply typecast your server to the name of the service interface like this:

      (RORemoteService as INewService).Sum(1,2)
}


{$R *.dfm}

end.
