<?php
    require_once(APPPATH."views/parts/Header.php");
    require_once(APPPATH."views/parts/Sidebar.php");
    $active = 'dashboard';
?>
<!-- page content -->
        <div class="right_col" role="main">
          <div class="">

            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12  ">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Daftar Normalisasi Data Awal</h2>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                      <div class="dx-viewport demo-container">
                        <div class="item form-group">
                          <label class="col-form-label col-md-3 col-sm-3 label-align" for="first-name">Panen Buah<span class="required">*</span>
                          </label>
                          <div class="col-md-3 col-sm-3 ">
                            <!-- <input type="number" name="Pekerjaan" id="Pekerjaan" required="" placeholder="Pekerjaan" class="form-control " step="0.0001"> -->
                            <select name="Kelompok" id="Kelompok" class="form-control">
                              <option value="MANGGA">MANGGA</option>
                              <option value="PEPAYA">PEPAYA</option>
                            </select>
                          </div>
                          <div class="col-md-3 col-sm-3 ">
                            <button class="btn btn-primary" id="bt_Search">Search</button>
                          </div>
                        </div>
                        <div id="data-grid-demo">
                          <div id="gridContainer">
                          </div>
                        </div>
                      </div>
                      <br>
                      <div class="item form-group">
                        <div class="col-md-3 col-sm-3 ">
                          <button name="bt_proses" id="bt_proses" class="form-control btn btn-secondary">Proses</button>
                          <!-- <input type="submit" name="button" id="button" required="" placeholder="Jumlah Cluster Dicari" class="form-control "> -->
                        </div>
                      </div>
                      <br>
                  </div>
                  <div id="Hasil">Ini section hasil</div>
                </div>
              </div>

            </div>

            <div class="row" style="display: block;">
              <div class="col-md-6 col-sm-6  ">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>C1</h2>
                  </div>
                  <div class="x_content">
                    <div class="dx-viewport demo-container">
                      <div id="data-grid-demo">
                        <div id="gridContainerHasil">
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div class="col-md-6 col-sm-6  ">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>C2</h2>
                  </div>
                  <div class="x_content">
                    <div class="dx-viewport demo-container">
                      <div id="data-grid-demo">
                        <div id="gridContainerHasil_C2">
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div class="col-md-6 col-sm-6  ">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>C3</h2>
                  </div>
                  <div class="x_content">
                    <div class="dx-viewport demo-container">
                      <div id="data-grid-demo">
                        <div id="gridContainerHasil_C3">
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

            </div>
          </div>
        </div>
        <!-- /page content -->

        <div class="modal fade bs-example-modal-lg" role="dialog" aria-hidden="true" id="modal_">
          <div class="modal-dialog modal-lg">
            <div class="modal-content">

              <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">Modal title</h4>
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                </button>
              </div>
              <div class="modal-body">
                
              </div>

              <!-- <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                
              </div> -->

            </div>
          </div>
        </div>
<?php
  require_once(APPPATH."views/parts/Footer.php");
?>
<!-- <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCG7FscIk67I9yY_fiyLc7-_1Aoyerf96E&sensor=false&libraries=places" async defer></script> -->
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places&key=AIzaSyCG7FscIk67I9yY_fiyLc7-_1Aoyerf96E"></script>
<script type="text/javascript">
  $(function () {
    var datanormalisasi;
    $(document).ready(function () {
      var where_field = '';
      var where_value = '';
      var table = 'users';

      $.ajax({
        async:false,
        type: "post",
        url: "<?=base_url()?>C_Proses/GetNormalisasiAwal",
        data: {'Kategori':$('#Kelompok').val()},
        dataType: "json",
        success: function (response) {
          datanormalisasi = response.data;
          bindGrid(response.data);
        }
      });

    });

    $('#bt_Search').click(function () {
      $.ajax({
        async:false,
        type: "post",
        url: "<?=base_url()?>C_Proses/GetNormalisasiAwal",
        data: {'Kategori':$('#Kelompok').val()},
        dataType: "json",
        success: function (response) {
          datanormalisasi = response.data;
          bindGrid(response.data);
        }
      });
    });
    $('#bt_proses').click(function () {
      $('#bt_proses').text('Proses, Please wait.....');
      $('#bt_proses').attr('disabled',true);
      $.ajax({
        async:false,
        type: "post",
        url: "<?=base_url()?>C_Proses/DeleteData",
        data: {'id':'','Kelompok':$('#Kelompok').val()},
        dataType: "json",
        success: function (responsex) {
          if (responsex.success == true) {
            console.log("Done Deleting");
          }
        }
      });

      $.ajax({
        async:false,
        type: "post",
        url: "<?=base_url()?>C_CentroidAwal/Read",
        data: {'id':'','Kelompok':$('#Kelompok').val()},
        dataType: "json",
        success: function (response) {
          // bindGrid(response.data);
          var html = "";
          var data_Centroid;
          var max_literasi = 7;
          if (response.success == true) {

            data_Centroid = response.data;
            console.log(datanormalisasi);
            for (var itt = 1; itt <= max_literasi; itt++) {
              html += "<h3><b>Iterasi ke "+ itt +" </b></h3> <br>"
              html += "Centroid Awal : <br>"
              html += "<table border = '1'>" +
                        "<tr>" +
                            "<td>Cluster</td>" +
                            "<td>LuasPanen</td>" +
                            "<td>Produksi</td>" +
                        "</tr>"
              for (var i = 0; i < data_Centroid.length ; i++) {
                html += "<tr><td>"+data_Centroid[i].Centroid+"</td>" +
                        "<td>"+data_Centroid[i].LuasPanen+"</td>" +
                        "<td>"+data_Centroid[i].Produksi+"</td>"
              }

              html += "</table><br><br>"

              html += "<b>Jarak cluster</b> <br>"

              html += "<table border = '1'>" +
                        "<tr>" +
                            "<td>ID</td>" +
                            "<td>Nama Kecamatan</td>" +
                            "<td>LuasPanen</td>" +
                            "<td>Produksi</td>" +
                            "<td>C1</td>" +
                            "<td>C2</td>" +
                            "<td>C3</td>" +
                            "<td>Jarak Terdekat</td>" +
                        "</tr>"


              var temp_array = []

              var LuasPanenC1 = 0;
              var LuasPanenC1_count=0;

              var LuasPanenC2 = 0;
              var LuasPanenC2_count =0;

              var LuasPanenC3 = 0;
              var LuasPanenC3_count =0;

              var ProduksiC1 = 0;
              var ProduksiC1_count =0;

              var ProduksiC2 = 0;
              var ProduksiC2_count =0;

              var ProduksiC3 = 0;
              var ProduksiC3_count =0;

              var keanggotaan = "";

              var hasilarray = [];

              for (var i_normal = 0; i_normal < datanormalisasi.length ; i_normal++) {
                // console.log(datanormalisasi[i_normal].ND_LuasPanen - data_Centroid[0].JmlProduksi)
                // console.log(Math.sqrt(datanormalisasi[i_normal].ND_LuasPanen - data_Centroid[0].JmlProduksi))
                // console.log(Math.sqrt(Math.pow(datanormalisasi[i_normal].ND_LuasPanen - data_Centroid[0].JmlProduksi,2)))
                var c1 = Math.sqrt(Math.pow(datanormalisasi[i_normal].ND_LuasPanen - data_Centroid[0].LuasPanen,2) + Math.pow(datanormalisasi[i_normal].ND_Produksi - data_Centroid[0].Produksi,2) )

                var c2 = Math.sqrt(Math.pow(datanormalisasi[i_normal].ND_LuasPanen - data_Centroid[1].LuasPanen,2) + Math.pow(datanormalisasi[i_normal].ND_Produksi - data_Centroid[1].Produksi,2) )

                var c3 = Math.sqrt(Math.pow(datanormalisasi[i_normal].ND_LuasPanen - data_Centroid[2].LuasPanen,2) + Math.pow(datanormalisasi[i_normal].ND_Produksi - data_Centroid[2].Produksi,2)  )

                var color1 = "";
                var color2 = "";
                var color3 = "";

                if (c1==Math.min(c1,c2,c3)) {
                  color1 = "#FFFF00";

                  LuasPanenC1 += parseFloat(datanormalisasi[i_normal].ND_LuasPanen);
                  ProduksiC1 += parseFloat(datanormalisasi[i_normal].ND_Produksi);
                  // PendidikanC1 += parseFloat(datanormalisasi[i_normal].ND_Pendidikan);
                  
                  LuasPanenC1_count += 1;
                  ProduksiC1_count += 1;
                  // PendidikanC1_count += 1;

                  keanggotaan = "C1"
                }
                else{
                  color1 = "";
                }

                if (c2==Math.min(c1,c2,c3)) {
                  color2 = "#FFFF00";

                  LuasPanenC2 += parseFloat(datanormalisasi[i_normal].ND_LuasPanen);
                  ProduksiC2 += parseFloat(datanormalisasi[i_normal].ND_Produksi);
                  // PendidikanC2 += parseFloat(datanormalisasi[i_normal].ND_Pendidikan);
                  
                  LuasPanenC2_count += 1;
                  ProduksiC2_count += 1;
                  // PendidikanC2_count += 1;

                  keanggotaan = "C2"
                }
                else{
                  color2 = "";
                }

                if (c3==Math.min(c1,c2,c3)) {
                  color3 = "#FFFF00";

                  LuasPanenC3 += parseFloat(datanormalisasi[i_normal].ND_LuasPanen);
                  ProduksiC3 += parseFloat(datanormalisasi[i_normal].ND_Produksi);
                  // PendidikanC3 += parseFloat(datanormalisasi[i_normal].ND_Pendidikan);
                  
                  LuasPanenC3_count += 1;
                  ProduksiC3_count += 1;
                  // PendidikanC3_count += 1;

                  keanggotaan = "C3"
                }
                else{
                  color3 = "";
                }
                // console.log(panenC1)
                 html += "<tr><td>"+datanormalisasi[i_normal].id+"</td>" +
                              "<td>"+datanormalisasi[i_normal].Nama+"</td>" +
                              "<td>"+datanormalisasi[i_normal].ND_LuasPanen+"</td>" +
                              "<td>"+datanormalisasi[i_normal].ND_Produksi+"</td>" +
                              "<td bgcolor = '"+color1+"'>"+c1+"</td>" +
                              "<td bgcolor = '"+color2+"'>"+c2+"</td>"+
                              "<td bgcolor = '"+color3+"'>"+c3+"</td>"+
                              "<td>"+Math.min(c1,c2,c3)+"</td></tr>"
                hasilarray.push({
                  "KodeData"  : datanormalisasi[i_normal].id,
                  "Keanggotaan" : keanggotaan,
                  "iterasi" : itt
                });
              }
              html += "</table>"

              // console.log(panenC1_count)

              temp_array.push({
                "id" : "1",
                "KodeData" : "0",
                "Centroid" : "1",
                "LuasPanen" : (LuasPanenC1 / LuasPanenC1_count).toString(),
                "Produksi" : (ProduksiC1 / ProduksiC1_count).toString(),
                // "Pendidikan" : (PendidikanC1 / PendidikanC1_count).toString()
              });

              temp_array.push({
                "id" : "2",
                "KodeData" : "0",
                "Centroid" : "2",
                "LuasPanen" : (LuasPanenC2 / LuasPanenC2_count).toString(),
                "Produksi" : (ProduksiC2 / ProduksiC2_count).toString(),
                // "Pendidikan" : (PendidikanC2 / PendidikanC2_count).toString()
              });

              temp_array.push({
                "id" : "3",
                "KodeData" : "0",
                "Centroid" : "3",
                "LuasPanen" : (LuasPanenC3 / LuasPanenC3_count).toString(),
                "Produksi" : (ProduksiC3 / ProduksiC3_count).toString(),
                // "Pendidikan" : (PendidikanC3 / PendidikanC3_count).toString()
              })
              // console.log(temp_array)
              // console.log(data_Centroid)
              // console.log(arraysEqual(data_Centroid,temp_array))
              if (arraysEqual(data_Centroid,temp_array)) {
                break;
              }
              data_Centroid = temp_array
              console.log(temp_array)
            }
            // akhir iterasi

            $('#Hasil').html(html);
            
            // console.log(hasilarray);
            for (var i = 0; i < hasilarray.length; i++) {
              $.ajax({
                async : false,
                type: "post",
                url: "<?=base_url()?>C_Proses/addhasil",
                data: {'KodeData':hasilarray[i].KodeData,'Keanggotaan':hasilarray[i].Keanggotaan,'iterasi':hasilarray[i].iterasi,'Kelompok':$('#Kelompok').val()},
                dataType: "json",
                success: function (response) {
                  if (response == true) {
                    console.log('done')
                  }
                }
              });
            }

            $.ajax({
              async : false,
              type: "post",
              url: "<?=base_url()?>C_Proses/getHasil",
              data :{'kelompok':'C1','NamaBuah':$('#Kelompok').val()},
              dataType: "json",
              success: function (response) {
                bindGridHasil(response)
              }
            });

            $.ajax({
              async : false,
              type: "post",
              url: "<?=base_url()?>C_Proses/getHasil",
              data :{'kelompok':'C2','NamaBuah':$('#Kelompok').val()},
              dataType: "json",
              success: function (response) {
                bindGridHasil_C2(response)
              }
            });

            $.ajax({
              async : false,
              type: "post",
              url: "<?=base_url()?>C_Proses/getHasil",
              data :{'kelompok':'C3','NamaBuah':$('#Kelompok').val()},
              dataType: "json",
              success: function (response) {
                bindGridHasil_C3(response)
              }
            });

            $('#bt_proses').text('Proses');
            $('#bt_proses').attr('disabled',false);
          }
        }
      });
    })
    function arraysEqual(a, b) {

      var LuasPanan_a =0;
      var Produksi_a = 0;
      // var Pendidikan_a = 0

      var LuasPanan_b =0;
      var Produksi_b = 0;
      // var Pendidikan_b = 0

      for (var i = 0; i < a.length; i++) {
        LuasPanan_a += parseFloat(a[i].LuasPanen);
        Produksi_a += parseFloat(a[i].Produksi);
        // Pendidikan_a += parseFloat(a[i].Pendidikan);
      }

      for (var x = 0; x < b.length; x++) {
        LuasPanan_b += parseFloat(b[x].LuasPanen);
        Produksi_b += parseFloat(b[x].Produksi);
        // Pendidikan_b += parseFloat(b[x].Pendidikan);
      }

      if ((LuasPanan_a + Produksi_a) == (Produksi_b + LuasPanan_b ) ) {
        return true;
      }
      else{
        return false;
      }

    }
    function bindGridHasil(data) {
      $("#gridContainerHasil").dxDataGrid({
        allowColumnResizing: true,
        dataSource: data,
        keyExpr: "nama",
        showBorders: true,
        allowColumnReordering: true,
        allowColumnResizing: true,
        columnAutoWidth: true,
        showBorders: true,
        paging: {
            enabled: false
        },
        columns: [
            {
                dataField: "nama",
                caption: "Nama",
                allowEditing:false
            },
            {
                dataField: "anggota",
                caption: "Keanggotaan",
                allowEditing:false
            },
            {
                dataField: "Keterangan",
                caption: "Keterangan",
                allowEditing:false
            },
        ],
      });
    }

    function bindGridHasil_C2(data) {
      $("#gridContainerHasil_C2").dxDataGrid({
        allowColumnResizing: true,
        dataSource: data,
        keyExpr: "nama",
        showBorders: true,
        allowColumnReordering: true,
        allowColumnResizing: true,
        columnAutoWidth: true,
        showBorders: true,
        paging: {
            enabled: false
        },
        columns: [
            {
                dataField: "nama",
                caption: "Nama",
                allowEditing:false
            },
            {
                dataField: "anggota",
                caption: "Keanggotaan",
                allowEditing:false
            },
            {
                dataField: "Keterangan",
                caption: "Keterangan",
                allowEditing:false
            },
        ],
      });
    }

    function bindGridHasil_C3(data) {
      $("#gridContainerHasil_C3").dxDataGrid({
        allowColumnResizing: true,
        dataSource: data,
        keyExpr: "nama",
        showBorders: true,
        allowColumnReordering: true,
        allowColumnResizing: true,
        columnAutoWidth: true,
        showBorders: true,
        paging: {
            enabled: false
        },
        columns: [
            {
                dataField: "nama",
                caption: "Nama",
                allowEditing:false
            },
            {
                dataField: "anggota",
                caption: "Keanggotaan",
                allowEditing:false
            },
            {
                dataField: "Keterangan",
                caption: "Keterangan",
                allowEditing:false
            },
        ],
      });
    }

    function bindGrid(data) {

      $("#gridContainer").dxDataGrid({
        allowColumnResizing: true,
            dataSource: data,
            keyExpr: "id",
            showBorders: true,
            allowColumnReordering: true,
            allowColumnResizing: true,
            columnAutoWidth: true,
            showBorders: true,
            paging: {
                enabled: false
            },
            editing: {
                mode: "row",
                // allowUpdating: true,
                // allowDeleting: true,
                texts: {
                    confirmDeleteMessage: ''  
                }
            },
            searchPanel: {
                visible: true,
                width: 240,
                placeholder: "Search..."
            },
            export: {
                enabled: true,
                fileName: "Daftar Data Awal"
            },
            columns: [
                {
                    dataField: "id",
                    caption: "#",
                    allowEditing:false
                },
                {
                    dataField: "Nama",
                    caption: "Nama",
                    allowEditing:false
                },
                {
                    dataField: "ND_LuasPanen",
                    caption: "Luas Panen",
                    allowEditing:false
                },
                {
                    dataField: "ND_Produksi",
                    caption: "Produksi",
                    allowEditing:false
                },
            ],
            onEditingStart: function(e) {
                GetData(e.data.id);
            },
            onInitNewRow: function(e) {
                // logEvent("InitNewRow");
                // $('#modal_').modal('show');
            },
            onRowInserting: function(e) {
                // logEvent("RowInserting");
            },
            onRowInserted: function(e) {
                // logEvent("RowInserted");
                // alert('');
                // console.log(e.data.onhand);
                // var index = e.row.rowIndex;
            },
            onRowUpdating: function(e) {
                // logEvent("RowUpdating");
                
            },
            onRowUpdated: function(e) {
                // logEvent(e);
            },
            onRowRemoving: function(e) {
              id = e.data.id;
              Swal.fire({
                title: 'Apakah anda yakin?',
                text: "anda akan menghapus data di baris ini !",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
              }).then((result) => {
                if (result.value) {
                  var table = 'app_setting';
                  var field = 'id';
                  var value = id;

                  $.ajax({
                      type    :'post',
                      url     : '<?=base_url()?>C_Data/CRUD',
                      data    : {'id':id,'formtype':'delete'},
                      dataType: 'json',
                      success : function (response) {
                        if(response.success == true){
                          Swal.fire(
                        'Deleted!',
                        'Your file has been deleted.',
                        'success'
                      ).then((result)=>{
                            location.reload();
                          });
                        }
                        else{
                          Swal.fire({
                            type: 'error',
                            title: 'Woops...',
                            text: response.message,
                            // footer: '<a href>Why do I have this issue?</a>'
                          }).then((result)=>{
                            location.reload();
                          });
                        }
                      }
                    });
                  
                }
                else{
                  location.reload();
                }
              })
            },
            onRowRemoved: function(e) {
              // console.log(e);
            },
        onEditorPrepared: function (e) {
          // console.log(e);
        }
        });

        // add dx-toolbar-after
        // $('.dx-toolbar-after').append('Tambah Alat untuk di pinjam ');
    }
  });
</script>