<template >
    <cv-data-table
      :columns="inference_headers"
      :pagination="basicPagination"
      ref="table">
        <cv-data-table-row v-for="row in inference_rows">
           <cv-data-table-cell>
             <img v-on:click="showModal({'name': 'view-image', 'inference': row})" style="width:300px;height:175px" :src="row['ImageURL']"/></img>
           </cv-data-table-cell>

           <cv-data-table-cell>
             <p>{{row['AnalysisType']}}</p>
           </cv-data-table-cell>

           <template v-if="Object.keys(row).includes('Heatmap/Boxes') && (! row['Heatmap/Boxes'].includes('|'))">
             <cv-data-table-cell ><img :src="'data:image/png;base64,' + row['Heatmap/Boxes']"></img></cv-data-table-cell>
           </template>
           <template v-else>
             <cv-data-table-cell >
               <template v-if="Object.keys(row).includes('Heatmap/Boxes') && (row['Heatmap/Boxes'].includes('|'))">
                 <li v-for="box in row['Heatmap/Boxes'].split('|')">
                     {{box}}
                 </li>
               </template>
             </cv-data-table-cell>
           </template>

           <cv-data-table-cell>
             <template v-if="Object.keys(row).includes('Class') && row['Class'].includes('|')">
                <li v-for="cls in row['Class'].split('|')">
                    {{cls}}
                </li>
             </template>
             <template v-else>
                 {{row['Class']}}
             </template>
           </cv-data-table-cell>

           <cv-data-table-cell>
             <template v-if="Object.keys(row).includes('Score') && row['Score'].includes('|')">
                <li v-for="score in row['Score'].split('|')">
                    {{score}}
                </li>
             </template>
             <template v-else>
                 {{row['Score']}}
             </template>
           </cv-data-table-cell>

           <cv-data-table-cell>
             <p>{{row['Time']}}</p>
           </cv-data-table-cell>
        </cv-data-table-row>
    </cv-data-table>
  </template>

<script>
// import CvDataTable from '@carbon/vue/src/components/cv-data-table';
// import CvDataTableRow from '@carbon/vue/src/components/cv-data-table';
// import CvDataTableCell from '@carbon/vue/src/components/cv-data-table';
import CvDataTable from '@carbon/vue/src/components/cv-data-table/';
import CvDataTableRow from '@carbon/vue/src/components/cv-data-table';
import CvDataTableCell from '@carbon/vue/src/components/cv-data-table';

export default {
  name: 'InfTable',
  components: {
    CvDataTable,
    CvDataTableRow,
    CvDataTableCell
  },
  props: ['inference_headers', 'inference_rows']
}
</script>
