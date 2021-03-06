<?php echo $header; ?>
<div id="content">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="icon-exclamation-sign"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="panel">
    <div class="panel-heading">
      <h1 class="panel-title"><i class="icon-edit icon-large"></i> <?php echo $heading_title; ?></h1>
      <div class="buttons">
        <button type="submit" form="form-worldpay" class="btn btn-primary"><i class="icon-ok"></i> <?php echo $button_save; ?></button>
        <a href="<?php echo $cancel; ?>" class="btn"><i class="icon-remove"></i> <?php echo $button_cancel; ?></a></div>
    </div>
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-worldpay" class="form-horizontal">
      <div class="form-group required">
        <label class="col-lg-3 control-label" for="input-merchant"><?php echo $entry_merchant; ?></label>
        <div class="col-lg-9">
          <input type="text" name="worldpay_merchant" value="<?php echo $worldpay_merchant; ?>" placeholder="<?php echo $entry_merchant; ?>" id="input-merchant" />
          <?php if ($error_merchant) { ?>
          <span class="error"><?php echo $error_merchant; ?></span>
          <?php } ?>
        </div>
      </div>
      <div class="form-group required">
        <label class="col-lg-3 control-label" for="input-password"><?php echo $entry_password; ?> <span class="help-block"><?php echo $help_password; ?></span></label>
        <div class="col-lg-9">
          <input type="text" name="worldpay_password" value="<?php echo $worldpay_password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" />
          <?php if ($error_password) { ?>
          <span class="error"><?php echo $error_password; ?></span>
          <?php } ?>
        </div>
      </div>
      <div class="form-group">
        <label class="col-lg-3 control-label" for="input-callback"><?php echo $entry_callback; ?> <span class="help-block"><?php echo $help_callback; ?></span></label>
        <div class="col-lg-9">
          <textarea cols="40" rows="5" id="input-callback" readonly="readonly"><?php echo $callback; ?></textarea>
        </div>
      </div>
      <div class="form-group">
        <label class="col-lg-3 control-label" for="input-test"><?php echo $entry_test; ?></label>
        <div class="col-lg-9">
          <select name="worldpay_test" id="input-test">
            <?php if ($worldpay_test == '0') { ?>
            <option value="0" selected="selected"><?php echo $text_off; ?></option>
            <?php } else { ?>
            <option value="0"><?php echo $text_off; ?></option>
            <?php } ?>
            <?php if ($worldpay_test == '100') { ?>
            <option value="100" selected="selected"><?php echo $text_successful; ?></option>
            <?php } else { ?>
            <option value="100"><?php echo $text_successful; ?></option>
            <?php } ?>
            <?php if ($worldpay_test == '101') { ?>
            <option value="101" selected="selected"><?php echo $text_declined; ?></option>
            <?php } else { ?>
            <option value="101"><?php echo $text_declined; ?></option>
            <?php } ?>
          </select>
        </div>
      </div>
      <div class="form-group">
        <label class="col-lg-3 control-label" for="input-total"><?php echo $entry_total; ?> <span class="help-block"><?php echo $help_total; ?></span></label>
        <div class="col-lg-9">
          <input type="text" name="worldpay_total" value="<?php echo $worldpay_total; ?>" placeholder="<?php echo $entry_total; ?>" id="input-total" />
        </div>
      </div>
      <div class="form-group">
        <label class="col-lg-3 control-label" for="input-order-status"><?php echo $entry_order_status; ?></label>
        <div class="col-lg-9">
          <select name="worldpay_order_status_id" id="input-order-status">
            <?php foreach ($order_statuses as $order_status) { ?>
            <?php if ($order_status['order_status_id'] == $worldpay_order_status_id) { ?>
            <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
      </div>
      <div class="form-group">
        <label class="col-lg-3 control-label" for="input-geo-zone"><?php echo $entry_geo_zone; ?></label>
        <div class="col-lg-9">
          <select name="worldpay_geo_zone_id" id="input-geo-zone">
            <option value="0"><?php echo $text_all_zones; ?></option>
            <?php foreach ($geo_zones as $geo_zone) { ?>
            <?php if ($geo_zone['geo_zone_id'] == $worldpay_geo_zone_id) { ?>
            <option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
      </div>
      <div class="form-group">
        <label class="col-lg-3 control-label" for="input-status"><?php echo $entry_status; ?></label>
        <div class="col-lg-9">
          <select name="worldpay_status" id="input-status">
            <?php if ($worldpay_status) { ?>
            <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
            <option value="0"><?php echo $text_disabled; ?></option>
            <?php } else { ?>
            <option value="1"><?php echo $text_enabled; ?></option>
            <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
            <?php } ?>
          </select>
        </div>
      </div>
      <div class="form-group">
        <label class="col-lg-3 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
        <div class="col-lg-9">
          <input type="text" name="worldpay_sort_order" value="<?php echo $worldpay_sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="input-mini" />
        </div>
      </div>
    </form>
  </div>
</div>
<?php echo $footer; ?> 