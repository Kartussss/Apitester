<script setup>
import SpellAdd from "./SpellAdd.vue";
import SpellDel from "./SpellDel.vue";
import SpellFind from "./SpellFind.vue";
</script>
<script>
export default {
    data() {
        return {
            opened: [],
            sectionColor: "w3-yellow",
            url: "http://localhost:3149/spell/"
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
<Head title="Spell" />
    <header class="w3-container " @click="toggle('Spells')" :class="{ opened: opened.includes('Spells')} +' '+ sectionColor">
        <h1>Test spell calls</h1>
    </header>
    <section class="w3-container" v-if="opened.includes('Spells')" >


    <div class="row-cols-1">
        <SpellFind
            :sectionColor=sectionColor
            subsection="spellFind"
            :url=url
        >
        </SpellFind>
    </div>
    <div class="row-cols-1" >
        <SpellAdd
            :sectionColor=sectionColor
            subsection="spellAdd"
            :url=url
        >
        </SpellAdd>
    </div>
    <div class="row-cols-1">
        <SpellDel
            :sectionColor=sectionColor
            subsection="spellDel"
            :url=url
        >
        </SpellDel>
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
