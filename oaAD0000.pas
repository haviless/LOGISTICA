Unit oaAD0000;
// Inicio Uso Estándares:   01/08/2011
// Unidad               :   oaAD0000
// Formulario           :   FADIni
// Fecha de Creación    :
// Autor                :   Equipo de Desarrollo
// Objetivo             :   formulario base para invocar las funcionalidades
//                          de las opciones de Parámetros

// Actualizaciones      :
// HPC_201202_LOG 09/04/2011   se independiza el mantenimiento de Proveedores, y se
//                             crea su propio paquete
// HPC_201208_LOG 22/05/2012:  Se implementó el control de versiones
// HPC_201404_LOG 21/10/2014   Control de Versiones 20141022080000
// HPC_201506_LOG 20/11/2014   Entrega al área de Calidad
// HPC_201601_LOG 22/09/2016   Control de Versión 20160923083000
// HPC_201602_LOG 24/10/2016   Cambio de Control de Versión a 20161024083000
// LOG_201805     19/11/2018   Cambio de Control de Versión a LOG-201805, cambio solo en el DFM

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, mant, DB, DBClient, wwclient, StdCtrls, PROVDM;

Type
   TFADIni = Class(TForm)
      lblVersion: TLabel;
   Private
    { Private declarations }
   Public
    { Public declarations }
      MantHelp: TMant;
   End;

Procedure ADDataModulo; stdcall;
Procedure ADDataModuloProv; stdcall;
Procedure ADMantenimientoAccesos; stdcall;
Procedure ADOpcionAccesos; stdcall;
Procedure ADOpcionAccesosShow; stdcall;
Procedure ADMantenimientoAyudaMant; stdcall;

Exports
   ADDataModulo,
   ADDataModuloProv,
   ADMantenimientoAccesos,
   ADOpcionAccesos,
   ADOpcionAccesosShow,
   ADMantenimientoAyudaMant;

Var
   FADIni: TFADIni;

Implementation

{$R *.dfm}

Uses LOGDM1;

Procedure ADDataModulo;
Begin
   Application.Initialize;
   Try
      If (DMLOG = Nil) Or (DMLOG.sClose = '1') Then
      Begin
         DMLOG := TDMLOG.Create(Application);
         If DMLOG.sClose = '1' Then
         Begin
            DMLOG.Free;
            DMLOG := Nil;
         End;
         {
         FADIni := TFADIni.Create(Application);
         If DMLOG.fg_VerificaVersion(FADIni.lblVersion.Caption) = False Then
         Begin
            ShowMessage('Su Sistema no está actualizado.' + #13 + 'Comuníquese con Soporte Técnico');
            Application.Terminate;
            Exit;
         End;
         }
      End;
   Finally
   End;
End;

Procedure ADDataModuloProv;
Begin
   Application.Initialize;
   Try
      If (DMPROV = Nil) Or (DMPROV.sClose = '1') Then
      Begin
         DMPROV := TDMPROV.Create(Application);
         DMPROV.DCOM1 := DMLOG.DCOM1;
         DMPROV.wUsuario := DMLOG.wUsuario;
         DMPROV.wAdmin := DMLOG.wAdmin;
         DMPROV.wGrupo := DMLOG.wGrupo;
         DMPROV.wModulo := DMLOG.wModulo;

         DMPROV.cdsCia.RemoteServer := DMLOG.DCOM1;
         DMPROV.cdsTdoc.RemoteServer := DMLOG.DCOM1;
         DMPROV.cdsTDiario.RemoteServer := DMLOG.DCOM1;
         DMPROV.cdsCCBco.RemoteServer := DMLOG.DCOM1;
         DMPROV.cdsTipReg.RemoteServer := DMLOG.DCOM1;
         DMPROV.cdsNivel.RemoteServer := DMLOG.DCOM1;

         DMPROV.cdsCanje.RemoteServer := DMLOG.DCOM1;
         DMPROV.cdsTMon.RemoteServer := DMLOG.DCOM1;
         DMPROV.cdsBanco.RemoteServer := DMLOG.DCOM1;
         DMPROV.cdsFPago.RemoteServer := DMLOG.DCOM1;
         DMPROV.cdsProv.RemoteServer := DMLOG.DCOM1;
         DMPROV.cdsCCosto.RemoteServer := DMLOG.DCOM1;
         DMPROV.cdsQry.RemoteServer := DMLOG.DCOM1;
         DMPROV.cdsDetCxP2.RemoteServer := DMLOG.DCOM1;
         DMPROV.cdsClAux.RemoteServer := DMLOG.DCOM1;
         DMPROV.cdsPais.RemoteServer := DMLOG.DCOM1;
         DMPROV.cdsDpto.RemoteServer := DMLOG.DCOM1;
         DMPROV.cdsProvinc.RemoteServer := DMLOG.DCOM1;
         DMPROV.cdsDistrito.RemoteServer := DMLOG.DCOM1;
         DMPROV.cdsSecEco.RemoteServer := DMLOG.DCOM1;
         DMPROV.cdsQry2.RemoteServer := DMLOG.DCOM1;
         DMPROV.cdsQry3.RemoteServer := DMLOG.DCOM1;
         DMPROV.cdsGiro.RemoteServer := DMLOG.DCOM1;
         DMPROV.cdsClasif.RemoteServer := DMLOG.DCOM1;
         DMPROV.cdsReporte.RemoteServer := DMLOG.DCOM1;
         DMPROV.cdsTipProv.RemoteServer := DMLOG.DCOM1;
         DMPROV.cdsMTipProv.RemoteServer := DMLOG.DCOM1;
         DMPROV.cdsTipPer.RemoteServer := DMLOG.DCOM1;
         DMPROV.cdsGArti.RemoteServer := DMLOG.DCOM1;
         DMPROV.cdsQry4.RemoteServer := DMLOG.DCOM1;
         DMPROV.cdsQry5.RemoteServer := DMLOG.DCOM1;
         DMPROV.cdsQry6.RemoteServer := DMLOG.DCOM1;
         DMPROV.cdsQry7.RemoteServer := DMLOG.DCOM1;
         DMPROV.cdsQry12.RemoteServer := DMLOG.DCOM1;
         DMPROV.cdsQry15.RemoteServer := DMLOG.DCOM1;
         DMPROV.cdsQry14.RemoteServer := DMLOG.DCOM1;
         DMPROV.cdsQry16.RemoteServer := DMLOG.DCOM1;
         DMPROV.cdsQry13.RemoteServer := DMLOG.DCOM1;
         DMPROV.cdsCargo.RemoteServer := DMLOG.DCOM1;

         DMPROV.cdsReglas.RemoteServer := DMLOG.DCOM1;
         DMPROV.cdsUsuarios.RemoteServer := DMLOG.DCOM1;
         DMPROV.cdsGrupos.RemoteServer := DMLOG.DCOM1;
         DMPROV.cdsMGrupo.RemoteServer := DMLOG.DCOM1;
         DMPROV.cdsAcceso.RemoteServer := DMLOG.DCOM1;
         DMPROV.cdsUltTGE.RemoteServer := DMLOG.DCOM1;
         DMPROV.cdsUser.RemoteServer := DMLOG.DCOM1;
         DMPROV.cdsUsuarioAct.RemoteServer := DMLOG.DCOM1;
         DMPROV.cdsCnpEgr.RemoteServer := DMLOG.DCOM1;
         DMPROV.cdsCCanje.RemoteServer := DMLOG.DCOM1;
         DMPROV.cdsQryRUC.RemoteServer := DMLOG.DCOM1;

         DMPROV.cdsConsulta.RemoteServer := DMLOG.DCOM1;
         DMPROV.cdsProvClientes.RemoteServer := DMLOG.DCOM1;
         DMPROV.cdsCtaBanco.RemoteServer := DMLOG.DCOM1;
         DMPROV.cdsRepLegal.RemoteServer := DMLOG.DCOM1;
         DMPROV.cdsContacto.RemoteServer := DMLOG.DCOM1;

         DMPROV.cdsCanje.ProviderName := 'prvIndRef';
         DMPROV.cdsTMon.ProviderName := 'prvIndRef';
         DMPROV.cdsBanco.ProviderName := 'prvIndRef';
         DMPROV.cdsFPago.ProviderName := DMLOG.cdsFPago.ProviderName;
         DMPROV.cdsProv.ProviderName := DMLOG.cdsProv.ProviderName;
         DMPROV.cdsCCosto.ProviderName := 'prvIndRef';
         DMPROV.cdsQry.ProviderName := DMLOG.cdsQry.ProviderName;
         DMPROV.cdsDetCxP2.ProviderName := DMLOG.cdsPais.ProviderName;

         DMPROV.cdsClAux.ProviderName := DMLOG.cdsClAux.ProviderName;
         DMPROV.cdsPais.ProviderName := DMLOG.cdsPais.ProviderName;
         DMPROV.cdsDpto.ProviderName := DMLOG.cdsDpto.ProviderName;
         DMPROV.cdsProvinc.ProviderName := DMLOG.cdsProvinc.ProviderName;
         DMPROV.cdsDistrito.ProviderName := DMLOG.cdsDistrito.ProviderName;
         DMPROV.cdsSecEco.ProviderName := DMLOG.cdsSecEco.ProviderName;
         DMPROV.cdsQry2.ProviderName := DMLOG.cdsQry2.ProviderName;
         DMPROV.cdsQry3.ProviderName := DMLOG.cdsQry3.ProviderName;
         DMPROV.cdsGiro.ProviderName := DMLOG.cdsGiro.ProviderName;
         DMPROV.cdsClasif.ProviderName := DMLOG.cdsClasif.ProviderName;
         DMPROV.cdsReporte.ProviderName := DMLOG.cdsReporte.ProviderName;
         DMPROV.cdsTipProv.ProviderName := DMLOG.cdsTipProv.ProviderName;
         DMPROV.cdsMTipProv.ProviderName := DMLOG.cdsMTipProv.ProviderName;
         DMPROV.cdsTipPer.ProviderName := DMLOG.cdsTipPer.ProviderName;
         DMPROV.cdsGArti.ProviderName := DMLOG.cdsGArti.ProviderName;
         DMPROV.cdsQry4.ProviderName := DMLOG.cdsQry4.ProviderName;
         DMPROV.cdsQry5.ProviderName := DMLOG.cdsQry5.ProviderName;
         DMPROV.cdsQry6.ProviderName := DMLOG.cdsQry6.ProviderName;

         DMPROV.cdsQry7.ProviderName := DMLOG.cdsLog.ProviderName;
         DMPROV.cdsQry12.ProviderName := DMLOG.cdsQry12.ProviderName;
         DMPROV.cdsQry15.ProviderName := 'prvIndRef';
         DMPROV.cdsQry14.ProviderName := 'prvIndRef';
         DMPROV.cdsQry16.ProviderName := 'prvIndRef';
         DMPROV.cdsQry13.ProviderName := 'prvIndRef';
         DMPROV.cdsConsulta.ProviderName := 'prvIndRef';
         DMPROV.cdsCargo.ProviderName := 'prvIndRef';

         DMPROV.cdsReglas.ProviderName := 'prvIndRef';
         DMPROV.cdsUsuarios.ProviderName := DMLOG.cdsUsuarios.ProviderName;
         DMPROV.cdsGrupos.ProviderName := DMLOG.cdsGrupos.ProviderName;
         DMPROV.cdsMGrupo.ProviderName := DMLOG.cdsMGrupo.ProviderName;
         DMPROV.cdsAcceso.ProviderName := DMLOG.cdsAcceso.ProviderName;
         DMPROV.cdsUltTGE.ProviderName := DMLOG.cdsUltTGE.ProviderName;
         DMPROV.cdsUser.ProviderName := DMLOG.cdsUser.ProviderName;
         DMPROV.cdsUsuarioAct.ProviderName := 'prvIndRef';
         DMPROV.cdsCnpEgr.ProviderName := 'prvIndRef';
         DMPROV.cdsCCanje.ProviderName := DMLOG.cdsCCanje.ProviderName;

         DMPROV.cdsConsulta.ProviderName := 'prvIndRef';
         DMPROV.cdsProvClientes.ProviderName := 'prvIndRef';
         DMPROV.cdsCtaBanco.ProviderName := 'prvIndRef';
         DMPROV.cdsRepLegal.ProviderName := 'prvIndRef';
         DMPROV.cdsContacto.ProviderName := 'prvIndRef';
         DMPROV.cdsCia.ProviderName := 'prvIndRef';
         DMPROV.cdsTdoc.ProviderName := 'prvIndRef';
         DMPROV.cdsTDiario.ProviderName := 'prvIndRef';
         DMPROV.cdsCCBco.ProviderName := 'prvIndRef';
         DMPROV.cdsTipReg.ProviderName := 'prvIndRef';
         DMPROV.cdsNivel.ProviderName := 'prvIndRef';
         DMPROV.cdsQryRUC.ProviderName := 'prvIndRef';

         DMPROV.DataModuleCreate1;

         If DMPROV.sClose = '1' Then
         Begin
            DMPROV.Free;
            DMPROV := Nil;
         End;
      End;
   Finally
   End;
End;

Procedure ADMantenimientoAccesos;
Begin
End;

Procedure ADOpcionAccesos;
Begin
End;

Procedure ADOpcionAccesosShow;
Begin
End;

Procedure ADMantenimientoAyudaMant;
Begin
   FADIni := TFADIni.Create(Nil);
   FADIni.MantHelp := TMant.Create(Application);
   FADIni.MantHelp.Module := DMLOG.wModulo;
   FADIni.MantHelp.Tipo := 'HELP';
   FADIni.MantHelp.Admin := 'N';
   FADIni.MantHelp.DComC := DMLOG.DCOM1;
   FADIni.MantHelp.User := DMLOG.wUsuario;
   FADIni.MantHelp.Execute;
End;

End.

