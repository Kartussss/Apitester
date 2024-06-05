<script setup>
import TranslateFind from "./TranslateFind.vue";
</script>
<script>
export default {
    data() {
        return {
            opened: [],
            sectionColor: "w3-blue",
            url: "https://google.com"
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
<Head title="Translate" />
    <header class="w3-container " @click="toggle('Translate')" :class="{ opened: opened.includes('Translate')} +' '+ sectionColor">
        <h1>Test Translate calls</h1>
    </header>
    <section class="w3-container" v-if="opened.includes('Translate')" >


    <div class="row-cols-1">
        <translate-find
            :sectionColor=sectionColor
            subsection="translateFind"
            :url=url
        >
        </translate-find>
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
