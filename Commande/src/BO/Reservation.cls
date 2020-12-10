Class BO.Reservation Extends EnsLib.REST.Operation
{

Property Adapter As EnsLib.HTTP.OutboundAdapter;

Parameter ADAPTER = "EnsLib.HTTP.OutboundAdapter";

Parameter INVOCATION = "Queue";

Method creerVoiture(pRequest As msg.creerVoitureDmde, Output pResponse As msg.creerVoitureRpse) As %Status
{
    set pResponse = ##class(msg.creerVoitureRpse).%New()

    set httpRequest = ##class(%Net.HttpRequest).%New()

    set request = ##class(msg.Reservation.creerVoitureDmde).%New()

    set request.nom = pRequest.voiture.marque_" "_pRequest.voiture.modele
    set request.categorie = pRequest.voiture.categorie
    set request.plaque = pRequest.voiture.plaque

    do ..ObjectToJSONStream(request, .EntityBody)

    set httpRequest.EntityBody = EntityBody

    set tsc = ..Adapter.SendFormDataArray(.httpResponse, "POST", httpRequest)

    do ..JSONStreamToObject(httpResponse.Data,.pResponse,"msg.creerVoitureRpse",1)

    Quit $$$OK
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="msg.creerVoitureDmde">
        <Method>creerVoiture</Method>
    </MapItem>
</MapItems>
}

}
