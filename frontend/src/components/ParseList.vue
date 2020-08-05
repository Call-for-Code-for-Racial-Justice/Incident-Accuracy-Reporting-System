<template v-if="Object.keys(row).includes('Score') && row['Score'].includes('|')">
   <li v-for="score in row['Score'].split('|')">
       {{score}}
   </li>
</template>
<template v-else>
    {{row['Score']}}
</template>
