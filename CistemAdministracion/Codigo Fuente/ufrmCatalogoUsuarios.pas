unit ufrmCatalogoUsuarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmCatalogo, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, dxmdaset, uDADataTable,
  uDAScriptingProvider, uDACDSDataTable, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxPC, cxTL, cxInplaceContainer, cxTLData, cxDBTL, cxMaskEdit,
  cxCheckBox, cxTextEdit, StdCtrls, cxLabel, cxDBEdit, cxContainer, cxGroupBox,
  uDAInterfaces, ImgList, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxDBLabel, uDAMemDataTable, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinSilver, dxSkinStardust,
  dxSkinValentine, dxSkinXmas2008Blue, cxLookAndFeelPainters, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, cxPCdxBarPopupMenu, cxLookAndFeels, cxNavigator,
  cxTLdxBarBuiltInMenu, uDAFields, uROComponent;

type
  TfrmCatalogoUsuarios = class(TfrmCatalogo)
    cxTabSheet3: TcxTabSheet;
    cdsOpcion: TDACDSDataTable;
    tlAccesos: TcxTreeList;
    cxTreeList1cxTreeListColumn1: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn2: TcxTreeListColumn;
    tlAccesoscxTreeListColumn1: TcxTreeListColumn;
    dbgCatalogoDBTableView1UsuarioID: TcxGridDBColumn;
    dbgCatalogoDBTableView1Nombre: TcxGridDBColumn;
    dbgCatalogoDBTableView1Usuario: TcxGridDBColumn;
    cdsAcceso: TDACDSDataTable;
    cxGroupBox1: TcxGroupBox;
    cxDBTextEdit1: TcxDBTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    cxLabel3: TcxLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    cxLabel4: TcxLabel;
    cxDBTextEdit4: TcxDBTextEdit;
    edtConfirmar: TcxTextEdit;
    lblConfirmar: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure cdsCatalogoNewRecord(DataTable: TDADataTable);
    procedure dsCatalogoStateChange(Sender: TObject);
    procedure cdsCatalogoBeforePost(DataTable: TDADataTable);
    procedure cdsCatalogoClaveChange(Sender: TDACustomField);
    procedure dbgCatalogoDBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure tlAccesosNodeChanged(Sender: TcxCustomTreeList;
      ANode: TcxTreeListNode; AColumn: TcxTreeListColumn);
  private
    { Private declarations }
    Editando, CambioClave: Boolean;
    procedure LimpiaAccesos;
    procedure ChecarPermisos(Estado: Boolean; ANode: TcxTreeListNode);
    procedure ActivarPermisos(UsuarioID: Integer);
    function Accesos: String;
  public
    { Public declarations }
    procedure ActionGuardar(Action: TBasicAction); override;
  end;

var
  frmCatalogoUsuarios: TfrmCatalogoUsuarios;

implementation

uses Modules, uDM;

{$R *.dfm}

function TfrmCatalogoUsuarios.Accesos: String;
var
  I: Integer;
  Lista: TStrings;
begin
  Result:='';
  Lista:=TStringList.Create;
  try

    for I := 0 to tlAccesos.AbsoluteCount - 1 do
    begin
      if (tlAccesos.AbsoluteItems[I].Values[0]) and (not tlAccesos.AbsoluteItems[I].HasChildren) then
        Lista.Add(tlAccesos.AbsoluteItems[I].Values[2]);
    end;
    Result:=Lista.Text;
  finally
    Lista.Free;
  end;
end;

procedure TfrmCatalogoUsuarios.ActionGuardar(Action: TBasicAction);
begin
  Editando:=True;
  inherited;

  DM.Servidor.GuardaAccesos(cdsCatalogo.FieldByName('IDEMPLEADO').AsInteger, Accesos);
end;

procedure TfrmCatalogoUsuarios.ActivarPermisos(UsuarioID: Integer);
var
  I, J: Integer;
begin
  LimpiaAccesos;
  Editando:=True;
  cdsAcceso.Filtered:=False;
  cdsAcceso.Filter:='USUARIOID = ' + IntToStr(UsuarioID);
  cdsAcceso.Filtered:=True;
  cdsAcceso.First;
  while not cdsAcceso.EOF do
  begin
    for I := 0 to tlAccesos.AbsoluteVisibleCount - 1 do
    begin
      for J := 0 to tlAccesos.AbsoluteVisibleItems[I].Count - 1 do
      begin
        if tlAccesos.AbsoluteVisibleItems[I].Items[J].Values[2] = cdsAcceso.FieldByName('OpcionID').AsInteger then
        begin
          tlAccesos.AbsoluteVisibleItems[I].Items[J].Values[0]:=True;
        end;
      end;
    end;
    cdsAcceso.Next;
  end;
  for I := 0 to tlAccesos.Count - 1 do
    ChecarPermisos(True, tlAccesos.Items[I]);
  Editando:=False;
end;

procedure TfrmCatalogoUsuarios.cdsCatalogoBeforePost(DataTable: TDADataTable);
begin
  inherited;
  if ((cdsCatalogo.State = dsInsert) or (CambioClave)) and (cdsCatalogo.FieldByName('Clave').AsString <> edtConfirmar.Text) then
  begin
    Application.MessageBox('La clave no coincide', 'Error', MB_OK+MB_ICONHAND+MB_DEFBUTTON1+MB_APPLMODAL);
    Abort;
  end;
end;

procedure TfrmCatalogoUsuarios.cdsCatalogoClaveChange(Sender: TDACustomField);
begin
  inherited;
  CambioClave:=True;
  lblConfirmar.Visible:=True;
  edtConfirmar.Visible:=True;
  edtConfirmar.SetFocus;
end;

procedure TfrmCatalogoUsuarios.cdsCatalogoNewRecord(DataTable: TDADataTable);
begin
  inherited;
  cdsCatalogo.FieldByName('IDEMPLEADO').AsInteger:=DM.Servidor.Folio('IDEMPLEADO', '');
end;

procedure TfrmCatalogoUsuarios.ChecarPermisos(Estado: Boolean;
  ANode: TcxTreeListNode);
var
  I: Integer;
begin
  if Estado = False then
  begin
    ANode.Values[0]:=False;
    Exit;
  end;

  if ANode.Values[0] = Estado then
    Exit;

  for I := 0 to ANode.Count - 1 do
  begin
    if ANode.Items[I].Values[0] <> Estado then
      Exit;
  end;
  ANode.Values[0]:=Estado;
end;

procedure TfrmCatalogoUsuarios.dbgCatalogoDBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  if (not Editando) and (cdsCatalogo.State = dsBrowse) then
    ActivarPermisos(cdsCatalogo.FieldByName('IDEMPLEADO').AsInteger);
   //Cargar  el limite a facturar//

end;

procedure TfrmCatalogoUsuarios.dsCatalogoStateChange(Sender: TObject);
begin
  inherited;
  lblConfirmar.Visible:=False;
  edtConfirmar.Visible:=False;
  edtConfirmar.Text:='';
  CambioClave:=False;
end;

procedure TfrmCatalogoUsuarios.FormCreate(Sender: TObject);
var
  Padre, Hijo: TcxTreeListNode;
begin
  cdsAcceso.Open;
  Padre:=nil;
  Editando:=True;
  cdsOpcion.Open;
  while not cdsOpcion.EOF do
  begin
    if cdsOpcion.FieldByName('OpcionID').AsInteger = cdsOpcion.FieldByName('PadreID').AsInteger then
    begin
      Padre:=tlAccesos.Add;
      Padre.Values[0]:=False;
      Padre.Values[1]:=cdsOpcion.FieldByName('Descripcion').AsString;
      Padre.ImageIndex:=cdsOpcion.FieldByName('ImageIndex').AsInteger;
      Padre.SelectedIndex:=cdsOpcion.FieldByName('ImageIndex').AsInteger;
    end
    else
    begin
      Hijo:=Padre.AddChild;
      Hijo.Values[0]:=False;
      Hijo.Values[1]:=cdsOpcion.FieldByName('Descripcion').AsString;
      Hijo.ImageIndex:=cdsOpcion.FieldByName('ImageIndex').AsInteger;
      Hijo.SelectedIndex:=cdsOpcion.FieldByName('ImageIndex').AsInteger;
      Hijo.Values[2]:=cdsOpcion.FieldByName('OpcionID').AsInteger;
    end;
    cdsOpcion.Next;
  end;
  inherited;
  Campo:='IDEMPLEADO';
  Editando:=False;
  ActivarPermisos(cdsCatalogo.FieldByName('IDEMPLEADO').AsInteger);
end;

procedure TfrmCatalogoUsuarios.LimpiaAccesos;
var
  I: Integer;
begin
  Editando:=True;

  for I := 0 to tlAccesos.AbsoluteItems[0].Count - 1 do
    tlAccesos.AbsoluteItems[0].Items[I].Values[0]:=False;
  Editando:=False;
end;

procedure TfrmCatalogoUsuarios.tlAccesosNodeChanged(Sender: TcxCustomTreeList;
  ANode: TcxTreeListNode; AColumn: TcxTreeListColumn);
var
  I: Integer;
begin
  inherited;

  if Editando then
    Exit;

  cdsCatalogo.Edit;

  if ANode.HasChildren then
  begin
    Editando:=True;
    for I:=0 to ANode.Count - 1 do
      ANode.Items[I].Values[0]:=ANode.Values[0];
    Editando:=False;
  end
  else
  begin
    Editando:=True;
    ChecarPermisos(ANode.Values[0], ANode.Parent);
    Editando:=False;
  end;
end;

initialization
  ModuleInfoManager.RegisterModule('Usuarios', TfrmCatalogoUsuarios);

end.
