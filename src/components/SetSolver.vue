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
        </div>
        <div>
            <form @submit="postImage">
                <input type="file" name="file" id="file" accept="image/*" capture="camera">
                <input type="submit" value="Submit">
            </form>
        </div>
    </div>
</template>

<script>
export default {
  name: 'SetSolver',
  data() {
      return {
          extractedImages: []
      }
  },
  props: {
      msg: String
  }, 
  
  methods: {
      async postImage(e) {
          e.preventDefault();
          const fileInput = document.querySelector('#file');
          const formData = new FormData();
          formData.append('file', fileInput.files[0]);

          const options = {
              method: 'POST',
              body: formData
          }

          const response = await fetch('/solve', options);
          if(response.ok) {
              this.extractedImages = []
              const json = await response.json();
              for(var idx in json) {
                  const pred = json[idx];
                  this.extractedImages.push(pred.card)
              }
            } else {
                this.status = "error, see console";
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
</style>
