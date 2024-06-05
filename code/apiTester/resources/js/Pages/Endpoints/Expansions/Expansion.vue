<script setup>
import ExpansionAdd from "./ExpansionAdd.vue";
import ExpansionDel from "./ExpansionDel.vue";
import ExpansionFind from "./ExpansionFind.vue";
</script>
<script>
export default {
    data() {
        return {
            opened: [],
            sectionColor: "w3-aqua"
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
    <Head title="Expansion" />
    <header class="w3-container" @click="toggle('Expansions')" :class="{ opened: opened.includes('Expansions') }+' '+ sectionColor">
        <h1>Test Expansion calls</h1>
    </header>
    <section class="w3-container" v-if="opened.includes('Expansions')" >

        <div class="row-cols-1">
            <ExpansionFind :sectionColor=sectionColor></ExpansionFind>
        </div>
        <div class="row-cols-1" >
            <ExpansionAdd :sectionColor="sectionColor"></ExpansionAdd>
        </div>
        <div class="row-cols-1">
            <ExpansionDel :sectionColor="sectionColor"></ExpansionDel>
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
    margin: 10px 30px 10px;
}
</style>
