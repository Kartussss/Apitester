<script setup>
import WordPredictionAdd from "./WordPredictionAdd.vue";
import WordPredictionFind from "./WordPredictionFind.vue";
</script>
<script>
export default {
    data() {
        return {
            opened: [],
            sectionColor: "w3-aqua",
            url: "http://localhost:3149/wordPrediction/"
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
<Head title="WordPrediction" />
    <header class="w3-container " @click="toggle('WordPredictions')" :class="{ opened: opened.includes('WordPredictions')} +' '+ sectionColor">
        <h1>Test wordPrediction calls</h1>
    </header>
    <section class="w3-container" v-if="opened.includes('WordPredictions')" >


    <div class="row-cols-1">
        <WordPredictionFind
            :sectionColor=sectionColor
            subsection="wordPredictionFind"
            :url=url
        >
        </WordPredictionFind>
    </div>
    <div class="row-cols-1" >
        <WordPredictionAdd
            :sectionColor=sectionColor
            subsection="wordPredictionAdd"
            :url="url+'/example'"
        >
        </WordPredictionAdd>
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
