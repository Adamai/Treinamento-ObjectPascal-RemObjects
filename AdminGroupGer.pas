unit AdminGroupGer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls,
  Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids, controller, NewLibrary_intf,AdminGroupCr;

type
  TFormAgGer = class(TForm, IAtualizaTela)
    Incluir: TButton;
    Alterar: TButton;
    Excluir: TButton;
    Cancelar: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ClientDataSetAdm: TClientDataSet;
    ClientDataSetAdmadmingroupid: TStringField;
    ClientDataSetAdmdescription: TStringField;
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    CheckBox1: TCheckBox;
    Button1: TButton;
    ComboBox1: TComboBox;
    procedure AlterarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CancelarClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure ExcluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure IncluirClick(Sender: TObject);
    procedure AtualizaTela;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAgGer: TFormAgGer;

implementation

//TERMINAR ESSA E A JANELA ADMINGROUPCR



{$R *.dfm}

procedure TFormAgGer.AlterarClick(Sender: TObject);
var
  Form4 : TFormAG;
begin
  Form4 := TFormAG.Create(Form4);
  try
    Form4.Alterar := true;
    Form4.ClientDataSet := ClientDataSetAdm;
    Form4.Edit1.Text := ClientDataSetAdm.Fields[0].AsString;
    Form4.Edit1.ReadOnly := true;
    Form4.Edit2.Text := ClientDataSetAdm.Fields[1].AsString;
    Form4.ShowModal;
  finally
    Form4.Free;
  end;
end;

procedure TFormAgGer.AtualizaTela;
begin
  ComboBox1.Clear;
  TController.getinstance.AdminRefresh(ClientDataSetAdm);
  TController.getinstance.carregarCBAdmGroup(combobox1);
end;



procedure TFormAgGer.Button1Click(Sender: TObject);
begin
  if checkbox1.Checked = true then
  begin
    tcontroller.getinstance.pesquisaradm(edit1.text,combobox1.text, ClientDataSetAdm);
  end
  else
  begin
    tcontroller.getinstance.pesquisaradm(edit1.text,'', ClientDataSetAdm);
  end;
end;

procedure TFormAgGer.CancelarClick(Sender: TObject);
begin
  close;
end;





procedure TFormAgGer.CheckBox1Click(Sender: TObject);
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



procedure TFormAgGer.ExcluirClick(Sender: TObject);
var
  Cadmingroup : admingroup;
begin
  Cadmingroup := admingroup.Create;
  try
    Cadmingroup.id := DBGrid1.Fields[1].AsString;
    Cadmingroup.comando := admCMDDetalhes;
    Cadmingroup := TController.GetInstance.Ctrladm(Cadmingroup, ClientDataSetAdm);   //l
    Cadmingroup.comando := admCMDExcluir;
    TController.GetInstance.Ctrladm(Cadmingroup, ClientDataSetAdm);
  finally
    Cadmingroup.Free;
  end;
end;





procedure TFormAgGer.FormCreate(Sender: TObject);
begin
  ClientDataSetAdm.CreateDataSet;
  TController.GetInstance.TelaSecundaria := self;
  AtualizaTela;
  ComboBox1.Enabled := false;
  ComboBox1.Style := csDropDownList;
end;

procedure TFormAgGer.IncluirClick(Sender: TObject);
var
  Form4 : TFormAG;
begin
  Form4 := TFormAG.Create(Form4);
  Form4.Alterar := false;
  Form4.ClientDataSet := ClientDataSetAdm;
  Form4.Combo := ComboBox1;
  try
    Form4.ShowModal;
  finally
    Form4.Free;
  end;
end;

end.
