import './bootstrap';

import { createApp } from "vue";
import Show from "./Pages/User/Show.vue"
import Tramem from "./Pages/Endpoints/Tramems/Tramem.vue";
import Expansion from "./Pages/Endpoints/Expansions/Expansion.vue";
import PredefinedTranslations from "./Pages/Endpoints/PredefinedTranslations/PredefinedTranslations.vue";
import Spell from "./Pages/Endpoints/Spells/Spell.vue";
import Translate from "./Pages/Endpoints/Translates/Translate.vue";
import Adddia from "./Pages/Endpoints/Adddia/Adddia.vue";
import WordPrediction from "./Pages/Endpoints/WordPrediction/WordPrediction.vue";
import Dictionary from "./Pages/Endpoints/Dictionary/Dictionary.vue";

const app = createApp ({
    comments:{
        Show,
        Tramem,
    }
});
app.component('welcome', Show)
app.component('tramem', Tramem)
app.component('expansion', Expansion)
app.component('predefinedTranslations', PredefinedTranslations)
app.component('spell', Spell)
app.component('translate', Translate)
app.component('adddia', Adddia)
app.component('wordPrediction', WordPrediction)
app.component('dictionary', Dictionary)
app.mount("#app");
