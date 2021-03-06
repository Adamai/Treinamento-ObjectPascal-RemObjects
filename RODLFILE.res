        ��  ��                  �  0   ��
 R O D L F I L E                     <?xml version="1.0" encoding="utf-8"?>
<Library Name="NewLibrary" UID="{60C5494A-F792-4B3E-8BE4-7A4857E996AF}" Version="3.0">
<Services>
<Service Name="NewService" UID="{2827544A-5DB7-407F-AD31-CF7BDA1EABFC}">
<Interfaces>
<Interface Name="Default" UID="{A3349381-5D0A-456D-B691-9BBC85F4A25D}">
<Documentation><![CDATA[Service NewService. This service has been automatically generated using the RODL template you can find in the Templates directory.]]></Documentation>
<Operations>
<Operation Name="Sum" UID="{CF26F92D-0519-4E24-BB6B-6D32FF420DC2}">
<Parameters>
<Parameter Name="Result" DataType="Integer" Flag="Result">
</Parameter>
<Parameter Name="A" DataType="Integer" Flag="In" >
</Parameter>
<Parameter Name="B" DataType="Integer" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="GetServerTime" UID="{DD0784F1-73FB-4EF6-B66F-521984DA7FC6}">
<Parameters>
<Parameter Name="Result" DataType="DateTime" Flag="Result">
</Parameter>
</Parameters>
</Operation>
<Operation Name="carregarSpeciality" UID="{14B590ED-F9F3-44A3-A973-6B3782CF6D53}">
<Parameters>
<Parameter Name="Result" DataType="speciality" Flag="Result">
</Parameter>
<Parameter Name="id" DataType="Utf8String" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="CarregarAdmingroup" UID="{426302C1-36AE-45AF-814A-9F328EA9500D}">
<Parameters>
<Parameter Name="Result" DataType="admingroup" Flag="Result">
</Parameter>
<Parameter Name="id" DataType="Utf8String" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="pesquisarSpeciality" UID="{5F5D6B42-2B41-4C30-8B22-2277B7514212}">
<Parameters>
<Parameter Name="Result" DataType="ArraySpeciality" Flag="Result">
</Parameter>
<Parameter Name="especialidade" DataType="Utf8String" Flag="In" >
</Parameter>
<Parameter Name="OS" DataType="Utf8String" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="pesquisarAdmin" UID="{02904093-E994-435D-B208-CA3C423C0C42}">
<Parameters>
<Parameter Name="Result" DataType="ArrayAdmin" Flag="Result">
</Parameter>
<Parameter Name="descricao" DataType="Utf8String" Flag="In" >
</Parameter>
<Parameter Name="OS" DataType="Utf8String" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="excluirAdmingroup" UID="{F2B4BF88-1E14-48EA-AB47-F66EC8651854}">
<Parameters>
<Parameter Name="id" DataType="Utf8String" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="AlterarAdmingroup" UID="{58A5FA92-5926-444B-A7DE-DB69939DAEC3}">
<Parameters>
<Parameter Name="description" DataType="Utf8String" Flag="In" >
</Parameter>
<Parameter Name="id" DataType="Utf8String" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="inserirAdmingroup" UID="{3B88872A-241A-456F-91C8-59CF104EE0B3}">
<Parameters>
<Parameter Name="Result" DataType="Boolean" Flag="Result">
</Parameter>
<Parameter Name="id" DataType="Utf8String" Flag="In" >
</Parameter>
<Parameter Name="description" DataType="Utf8String" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="inserirSpeciality" UID="{F0C86179-D752-4878-BD62-BCBB09D14AAB}">
<Parameters>
<Parameter Name="Result" DataType="Boolean" Flag="Result">
</Parameter>
<Parameter Name="id" DataType="Utf8String" Flag="In" >
</Parameter>
<Parameter Name="description" DataType="Utf8String" Flag="In" >
</Parameter>
<Parameter Name="flag" DataType="Boolean" Flag="In" >
</Parameter>
<Parameter Name="admingroup" DataType="Utf8String" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="alterarSpeciality" UID="{35B6FF18-8581-4F4A-8092-B79BB2A9B97E}">
<Parameters>
<Parameter Name="description" DataType="Utf8String" Flag="In" >
</Parameter>
<Parameter Name="flag" DataType="Boolean" Flag="In" >
</Parameter>
<Parameter Name="admingroup" DataType="Utf8String" Flag="In" >
</Parameter>
<Parameter Name="id" DataType="Utf8String" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="excluirSpeciality" UID="{82065792-B664-4801-ABAE-4A6CFD78E347}">
<Parameters>
<Parameter Name="id" DataType="Utf8String" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="ListaSpeciality" UID="{A5D1FA67-1B5A-46DD-908D-ED007E9A1647}">
<Parameters>
<Parameter Name="Result" DataType="ArraySpeciality" Flag="Result">
</Parameter>
</Parameters>
</Operation>
<Operation Name="ListaAdminGroup" UID="{D7A10072-93D9-4C97-AA9F-27495B75208B}">
<Parameters>
<Parameter Name="Result" DataType="ArrayAdmin" Flag="Result">
</Parameter>
</Parameters>
</Operation>
</Operations>
</Interface>
</Interfaces>
</Service>
</Services>
<Structs>
<Struct Name="admingroup" UID="{21B1A672-1977-4865-9BD3-8C344B41BAD6}" AutoCreateParams="1">
<Elements>
<Element Name="id" DataType="Utf8String">
</Element>
<Element Name="description" DataType="Utf8String">
</Element>
<Element Name="comando" DataType="comandosADM">
</Element>
</Elements>
</Struct>
<Struct Name="speciality" UID="{9222A355-E92D-40F0-844E-7EE44F220BAA}" AutoCreateParams="1">
<Elements>
<Element Name="id" DataType="Utf8String">
</Element>
<Element Name="description" DataType="Utf8String">
</Element>
<Element Name="flag_funcao_oper" DataType="Boolean">
</Element>
<Element Name="codg_admingroup_fk" DataType="Utf8String">
</Element>
<Element Name="comando" DataType="comandosSpec">
</Element>
</Elements>
</Struct>
</Structs>
<Enums>
<Enum Name="comandosADM" UID="{0309B5C2-D247-4EBE-A8E7-DA3A9BEA2BF0}" Prefix="0">
<EnumValues>
<EnumValue Name="AdmCMDDetalhes">
</EnumValue>
<EnumValue Name="AdmCMDInserir">
</EnumValue>
<EnumValue Name="AdmCMDAlterar">
</EnumValue>
<EnumValue Name="AdmCMDExcluir">
</EnumValue>
</EnumValues>
</Enum>
<Enum Name="comandosSpec" UID="{DA6702A1-D7D5-4FE4-9D33-4127C8D1898E}" Prefix="0">
<EnumValues>
<EnumValue Name="specCMDDetalhes">
</EnumValue>
<EnumValue Name="specCMDAlterar">
</EnumValue>
<EnumValue Name="specCMDInserir">
</EnumValue>
<EnumValue Name="specCMDExcluir">
</EnumValue>
</EnumValues>
</Enum>
</Enums>
<Arrays>
<Array Name="ArrayAdmin" UID="{1D35D21C-84C1-4B32-AEE2-81682AB31E34}">
<ElementType DataType="admingroup" />
</Array>
<Array Name="ArraySpeciality" UID="{B576CC26-7E64-4B66-B16C-2E12EDA07867}">
<ElementType DataType="speciality" />
</Array>
</Arrays>
</Library>
