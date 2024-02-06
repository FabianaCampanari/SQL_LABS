
-- teste
select p.nome, v.Data, v.ValorTotal, v.Desconto, vd.Quantidade, ((v.ValorTotal-
v.desconto) * vd.Quantidade) vl_unitario from Produto p left join VendaDetalhe vd
on vd.ProdutoId = p.Id left join Vendas v on vd.VendasId = v.VendaId
