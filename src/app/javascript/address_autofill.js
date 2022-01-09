$(function () {
  $('#shop_postcode').jpostal({
    click: '#jpostal-btn',
    postcode: ['#shop_postcode'],
    address: {
      '#shop_prefecture_code': '%3',
      '#shop_address_city': '%4',
      '#shop_address_street': '%5%6%7',
    },
  });
});