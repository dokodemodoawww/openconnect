/**
 * カラー変更のサンプル
 */
  var bg_color = document.getElementById('bg-color');


bg_color= function () {
document.querySelector('body').style.backgroundColor = this.value;
console.log('bg-color:'+this.value);
}
