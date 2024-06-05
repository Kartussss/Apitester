<script setup>
import TramemAdd from "./TramemAdd.vue";
import TramemDel from "./TramemDel.vue";
import TramemFind from "./TramemFind.vue";
</script>
<script>
export default {
    data() {
        return {
            opened: [],
            sectionColor: "w3-green",
            url: "http://localhost:3149/tramem/"
        };
    },
    methods:{
        toggle(id) {
            console.log('toggling')
            const index = this.opened.indexOf(id);
            if (index > -1) {
                this.opened.splice(index, 1)
            } else {
                this.opened.push(id)
            }
        }
    }
};
</script>

<template>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<Head title="Tramem" />
    <header class="w3-container " @click="toggle('Tramems')" :class="{ opened: opened.includes('Tramems')} +' '+ sectionColor">
        <h1>Test tramem calls</h1>
    </header>
    <section class="w3-container" v-if="opened.includes('Tramems')" >


    <div class="row-cols-1">
        <TramemFind
            :sectionColor=sectionColor
            subsection="tramemFind"
            :url=url
        >
        </TramemFind>
    </div>
    <div class="row-cols-1" >
        <TramemAdd
            :sectionColor=sectionColor
            subsection="tramemAdd"
            :url=url
        >
        </TramemAdd>
    </div>
    <div class="row-cols-1">
        <TramemDel
            :sectionColor=sectionColor
            subsection="tramemDel"
            :url=url
        >
        </TramemDel>
    </div>
</section>
</template>

<style scoped>
button {
    align-self: self-end;
    display: block;
    margin-left: auto;
}
header {
    margin: 0PX 20PX 10px;
    border-radius: 15px 50px;
    background: #73AD21;
    padding: 5px 40px 10px;
}
section {
    margin: 10px 30px 20px;
}
.row-cols-1{
    max-width: 100%;
    max-height: 100%;
}
</style>
