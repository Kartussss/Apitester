<script setup>
import PredefinedTranslationsAdd from "./PredefinedTranslationsAdd.vue";
import PredefinedTranslationsFind from "./PredefinedTranslationsFind.vue";
</script>
<script>
export default {
    data() {
        return {
            opened: [],
            sectionColor: "w3-cyan"
        };
    },
    methods:{
        toggle(id) {
            console.log('toggling', id)
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
<Head title="PredefinedTranslations" />
    <header class="w3-container" @click="toggle('PredefinedTranslations')"
            :class="{ opened: opened.includes('PredefinedTranslations') }+' '+ sectionColor">
        <h1>Test Predefined Translations calls</h1>
    </header>
    <section class="w3-container" v-if="opened.includes('PredefinedTranslations')" >
        <div class="row-cols-1">
            <PredefinedTranslationsFind :sectionColor=sectionColor></PredefinedTranslationsFind>
        </div>
        <div class="row-cols-1" >
            <PredefinedTranslationsAdd :sectionColor=sectionColor></PredefinedTranslationsAdd>
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
