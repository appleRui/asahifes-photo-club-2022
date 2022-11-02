template = %{
  <div class="col-md-4 text-center animate-box">
    <a class="work" href="./entries/entrie<%= @id %>.html">
      <div class="work-grid" style="background-image: url(./assets/images/<%= @fileName %>)">
        <div class="inner">
          <div class="desc">
            <h3><%= @nickName %></h3>
          </div>
        </div>
      </div>
    </a>
  </div>
}.gsub(/^  /, '')