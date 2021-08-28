<template>
    <div class="hello">
        <h1>{{ msg }}</h1>
        <div v-if="extractedImages.length > 0">
            <p>
                {{extractedImages.length}} extracted cards
            </p>
            <span v-for="img in extractedImages" :key="img">
                <img v-bind:src="require(`../assets/card_icons/${img}.png`)">
            </span>
            <p>
                {{foundSets.length}} found sets
            </p>
            <div v-for="set in foundSets" :key="set">
                <span v-for="img in set" :key="img">
                    <img v-bind:src="require(`../assets/card_icons/${img}.png`)">
                </span>
            </div>
        </div>
        <div>
            <form>
                <div class="formInputs">
                    <label for="cardBoard" class="button">Take picture</label>
                    <input type="file" name="file" id="cardBoard" accept="image/*" capture="camera" @change="postImage">
                </div>
            </form>
        </div>
    </div>
</template>

<script>
export default {
  name: 'SetSolver',
  data() {
      return {
          extractedImages: [],
          foundSets: []
      }
  },
  props: {
      msg: String
  }, 
  
  methods: {
      async postImage(e) {
          e.preventDefault();
          const fileInput = document.querySelector('#cardBoard');
          const formData = new FormData();
          formData.append('file', fileInput.files[0]);

          const options = {
              method: 'POST',
              body: formData
          }

          const response = await fetch('/solve', options);
          if(response.ok) {
              this.extractedImages = [];
              const json = await response.json();
              var extractedCards = json.extractedCards;
              for(var idx in extractedCards) {
                  this.extractedImages.push(extractedCards[idx].card);
              }

              this.foundSets = json.foundSets;
            } else {
                console.error("error happened.");
            }
      }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
img {
  margin: 2px;
  border: 1px solid black;
}

.button {
    border:1px solid green;
    background-color: khaki;
    padding:10px;
}

#cardBoard {
    visibility: hidden;
}

.formInputs {
    width:200px;
    margin: 40px auto;
}
</style>
