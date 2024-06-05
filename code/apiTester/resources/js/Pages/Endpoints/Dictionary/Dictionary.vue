<script setup>
import DictionaryAdd from "./DictionaryAdd.vue";
import DictionaryDel from "./DictionaryDel.vue";
import DictionaryFind from "./DictionaryFind.vue";
</script>
<script>
export default {
    data() {
        return {
            opened: [],
            sectionColor: "w3-cyan",
            url: "http://localhost:3149/dictionary/"
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
<Head title="Dictionary" />
    <header class="w3-container " @click="toggle('Dictionarys')" :class="{ opened: opened.includes('Dictionarys')} +' '+ sectionColor">
        <h1>Test dictionary calls</h1>
    </header>
    <section class="w3-container" v-if="opened.includes('Dictionarys')" >


    <div class="row-cols-1">
        <DictionaryFind
            :sectionColor=sectionColor
            subsection="dictionaryFind"
            :url=url
        >
        </DictionaryFind>
    </div>
    <div class="row-cols-1" >
        <DictionaryAdd
            :sectionColor=sectionColor
            subsection="dictionaryAdd"
            :url=url
        >
        </DictionaryAdd>
    </div>
    <div class="row-cols-1">
        <DictionaryDel
            :sectionColor=sectionColor
            subsection="dictionaryDel"
            :url=url
        >
        </DictionaryDel>
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
