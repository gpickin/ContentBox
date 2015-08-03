<cfoutput>
<script>
$(document).ready(function() {
    Morris.Donut( {
        element: 'top-visited-chart',
        data: #prc.aTopContent#,
        colors: [
            '##f1c40f','##2dcc70','##e84c3d','##0099FF','##993399','##FF9900'
        ],
        formatter: function ( x ) { 
            var pluralized = x>1 ? 's' : '';
            return x + " Hit" + pluralized;
        }
    } );

    Morris.Donut( {
        element: 'top-commented-chart',
        data: #prc.aTopCommented#,
        colors: [
            '##f1c40f','##2dcc70','##e84c3d','##0099FF','##993399','##FF9900'
        ],
        formatter: function ( x ) { 
            var pluralized = x>1 ? 's' : '';
            return x + " Hit" + pluralized;
        }
    } );
} );
</script>
</cfoutput>