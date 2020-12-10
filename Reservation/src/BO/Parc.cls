Class BO.Parc Extends Ens.BusinessOperation
{

Property Adapter As Ens.OutboundAdapter;

Parameter ADAPTER = "Ens.OutboundAdapter";

Parameter INVOCATION = "Queue";

Method checkReservation(pRequest As msg.checkReservationDmde, Output pResponse As msg.checkReservationRpse) As %Status
{
    set pResponse = ##class(msg.checkReservationRpse).%New()
    set sql = "select count(*) as reservations from data.Reservation WHERE dateFin >= NOW() AND voiture->plaque = '"_pRequest.plaque_"'"
    set statement = ##class(%SQL.Statement).%New()
    do statement.%Prepare(sql)
    set sqlRequest = statement.%Execute()
    do sqlRequest.%Next()
    set pResponse.reservation = sqlRequest.%Get("reservations")
    set pResponse.codeRetour = "OK"
    Quit $$$OK
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="msg.checkReservationDmde">
        <Method>checkReservation</Method>
    </MapItem>

</MapItems>
}

}
