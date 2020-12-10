Class BO.File Extends Ens.BusinessOperation
{

Property Adapter As EnsLib.File.OutboundAdapter;

Parameter ADAPTER = "EnsLib.File.OutboundAdapter";

Parameter INVOCATION = "Queue";

Method fileCall(vRequest As msg.pushVoitureFileDmde, Output vResponse As msg.pushVoitureFileRpse) As %Status
{
    set vResponse = ##class(msg.pushVoitureFileRpse).%New()
    set stream = ##class(%Library.FileBinaryStream).%New()
    Do stream.Write(vRequest.voiture.marque_";"_vRequest.voiture.modele_";"_vRequest.voiture.categorie_";"_vRequest.voiture.plaque_";"_vRequest.voiture.couleur_";"_vRequest.voiture.nbPlaces)
  
    set tsc = ..Adapter.PutStream("fichierVoiture.csv",stream)

    if tsc {
        set vResponse.codeRetour = "OK"
    }
    else{
        set vResponse.codeRetour = "KO"
    }
    Quit $$$OK
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="msg.pushVoitureFileDmde">
        <Method>fileCall</Method>
    </MapItem>
</MapItems>
}

}
